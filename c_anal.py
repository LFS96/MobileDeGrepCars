from bs4 import BeautifulSoup
from a_findNewAdvertisments import get_mysql_connector
import datetime
from os import system, name
from multiprocessing.dummy import Pool as ThreadPool
import re
counter = -1
total = 20000

# Print iterations progress
def printProgressBar (iteration, total, prefix = '', suffix = '', decimals = 1, length = 100, fill = '█', printEnd = "\r"):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
        printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
    """
    percent = ("{0:." + str(decimals) + "f}").format(100 * (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    clear()
    print(f'\r{prefix} |{bar}| {percent}% {suffix}', end = printEnd)
    # Print New Line on Complete
    if iteration == total:
        print()

def clear():
    # for windows
    if name == 'nt':
        _ = system('cls')

    # for mac and linux(here, os.name is 'posix')
    else:
        _ = system('clear')

def increaseCounter():
        global counter
        global total
        counter += 1
        printProgressBar(counter, total)

# Liefert den Webseitenquelltext zu einer ID
def get_data(mydb, num):
    mycursor = mydb.cursor()
    #print(num)
    mycursor.execute("SELECT raw FROM mobilede.advertisements WHERE id = %s ", (num,))
    myresult = mycursor.fetchall()
    for x in myresult:
        mycursor.close()
        mydb.close()
        return x[0]

# Liefert die ID eines Features Zurück, im Zweifel legt es eine ID  an
def create_features(mydb, feature):
    mycursor = mydb.cursor()
    sql = "SELECT id FROM mobilede.features WHERE name = %s"
    mycursor.execute(sql, (feature,))
    for results in mycursor.fetchall():
        mycursor.close()
        return results[0]
    else:
        mycursor.execute("INSERT INTO mobilede.features (name) VALUES ( %s )", (feature,))
        mydb.commit()
        mycursor.close()
        return create_features(feature)

# Speichert alle Features eines Wagens
def save_car_features(mydb, a_id, features):
    mycursor = mydb.cursor()
    for feature in features:
        f_id = create_features(mydb, feature) # Fragt die ID zu dem Namen eines Features ab
        mycursor.execute("INSERT INTO mobilede.cars_features (car, feature) VALUES ( %s, %s )", (a_id, f_id))
        mydb.commit()
    mycursor.close()


# Analyse deines gegebenen MySQL Entry
def save_car(data):
    mydb = get_mysql_connector()

    num = data[0]
    html = data[1]
    soup = BeautifulSoup(html, 'html.parser')

    try:
        title = soup.find('title').get_text()
        # print(str(num) + " - " + title)

        preis = int("".join(filter(str.isdigit, soup.find("span", {"class": "h3", "data-testid": "prime-price"}).get_text())))

        # Fahrzeugstand
        try:
            fahrzeugzustand = soup.find("div", {"class": "g-col-6", "id": "damageCondition-v"}).get_text()
        except:
            fahrzeugzustand = None

        # laufleistung
        try:
            laufleistung = int("".join(filter(str.isdigit, soup.find("div", {"class": "g-col-6", "id": "mileage-v"}).get_text())))
        except:
            laufleistung = None

        try:
            hubraum = int("".join(filter(str.isdigit, soup.find("div", {"class": "g-col-6", "id": "cubicCapacity-v"}).get_text()))[:-1])
        except:
            hubraum = None
        leistung = int(soup.find("div", {"class": "g-col-6", "id": "power-v"}).get_text().split()[0])
        treibstoff = soup.find("div", {"class": "g-col-6", "id": "fuel-v"}).get_text()

        # Emission
        try:
            CO2 = int("".join(filter(str.isdigit, soup.find("div", {"class": "g-col-6", "id": "envkv.emission-v"}).get_text())))
        except:
            CO2 = None

        # Schlatung
        try:
            schaltung = soup.find("div", {"class": "g-col-6", "id": "transmission-v"}).get_text()
        except:
            schaltung = None

        # Erstzulassung
        try:
            erstzulassung = datetime.datetime.strptime(soup.find("div", {"class": "g-col-6", "id": "firstRegistration-v"}).get_text(), "%m/%Y").date()
        except:
            erstzulassung = None

        # Beschreibung
        try:
            description = soup.find("div", {"class": "description"}).get_text()
        except:
            description = ""

        # FARBE
        try:
            color = soup.find("div", {"class": "g-col-6", "id": "color-v"}).get_text()
        except:
            color = ""

        try:
            color_manufacturer = soup.find("div", {"class": "g-col-6", "id": "manufacturerColorName-v"}).get_text()
        except:
            color_manufacturer = ""

        # Category
        try:
            category = soup.find("div", {"class": "g-col-6", "id": "category-v"}).get_text()
        except:
            category = ""

        # Marke
        try:
            brand = soup.find("meta", {"property": "og:title"})["content"]
        except:
            brand = ""

        # Modell
        try:
          model = soup.find("div", {"class": "financing-overlay__main"}).find("h3").get_text().replace("Diesen", "").replace(brand, "").replace("finanzieren?", "").strip()
        except:
          model = ""

        try:
            s = soup.find("p", {"class": "seller-address"}).get_text()
            start = s.find('DE-') + 3
            plz = s[start:start+5]
        except:
            plz = ""

        i = 0
        verbrauch_kombiniert = verbrauch_innerorts = verbrauch_ausserorts = 0
        for v in BeautifulSoup(str(soup.find("div", {"class": "g-col-6", "id": "envkv.consumption-v"})), 'html.parser').find_all("div", {"class": "u-margin-bottom-9"}):
            verbrauch = v.get_text()
            begin = 4
            end = 0
            if(verbrauch[-1] == "*"):
                begin = 0
                end = -1

            if i == 0:
                verbrauch_kombiniert = float(verbrauch[begin:(-20 + end)].replace(",", "."))
            if i == 1:
                verbrauch_innerorts = float(verbrauch[begin:(-19 + end)].replace(",", "."))
            if i == 2:
                verbrauch_ausserorts = float(verbrauch[begin:(-19 + end)].replace(",", "."))
            i += 1

        features = []
        for f in BeautifulSoup(str(soup.find("div", {"class": "cBox-body", "id": "features"})), 'html.parser').find_all(
                "div", {"class": "bullet-list"}):
            features.append(f.get_text())

        """
        print(preis)
        print(fahrzeugzustand)
        print(laufleistung)
        print(hubraum)
        print(leistung)
        print(verbrauch_kombiniert)
        print(verbrauch_innerorts)
        print(verbrauch_ausserorts)
        print(treibstoff)
        print(CO2)
        print(schaltung)
        print(erstzulassung)
        print(features)
        print(description)
        """

        status = 2


        my_cursor = mydb.cursor()
        sql = "INSERT IGNORE INTO mobilede.cars " \
              "(id, title, price,damage, mileage, displacement, power, " \
              "consumption_k, consumption_i, consumption_a, fuel, emission, transmission, registration, info," \
              "color, color_manf, manufacturer, model, category, city) " \
              "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        val = (num, title, preis, fahrzeugzustand, laufleistung, hubraum, leistung,
               verbrauch_kombiniert, verbrauch_innerorts, verbrauch_ausserorts,
               treibstoff, CO2, schaltung, erstzulassung, description,
               color, color_manufacturer, brand, model, category, plz)
        my_cursor.execute(sql, val)
        my_cursor.close()
        mydb.commit()

        save_car_features(mydb, num, features)
    except:
        status = 99

    increaseCounter()
    my_cursor = mydb.cursor()
    my_cursor.execute("UPDATE mobilede.advertisements SET status = %s WHERE id = %s ", (status, num,))
    mydb.commit()
    my_cursor.close()
    mydb.close()

# Verarbeitet heruntergeladene Webseitenquelltexte
def find_db_entry():
    global total
    limit = total
    mydb = get_mysql_connector()

    increaseCounter()

    mycursor = mydb.cursor()
    increaseCounter()
    mycursor.execute("SELECT id, raw FROM mobilede.advertisements WHERE status = 1 LIMIT " + str(limit))

    myresult = mycursor.fetchall()


    # mit Pools (Multithreads)
    pool = ThreadPool(64)
    pool.map(save_car, myresult)

    mycursor.close()
    mydb.close()
    # Single Threads
   # for x in myresult:
   #     save_car(x[0])

if __name__ == '__main__':
    find_db_entry()
