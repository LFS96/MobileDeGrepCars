# Schritt A
# fragt mobile.de ab und sucht nach Inserats Urls
# diese werden dann in einer Datenbank gespeichert



import requests
from bs4 import BeautifulSoup
import mysql.connector
from urllib.parse import urlparse
from urllib.parse import parse_qs

# Creates a MYSQL Connection
def get_mysql_connector():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="mobilede"
    )

# get parameter from  URL
def get_url_parameter(url, parameter):
    parsed_url = urlparse(url)
    return parse_qs(parsed_url.query)[parameter][0]

# Creates a new DB Entry from given URL
def create_advertisements(url):
    mydb = get_mysql_connector()
    my_cursor = mydb.cursor()

    advertisments_id = get_url_parameter(url, "id")
    sql = "INSERT IGNORE INTO mobilede.advertisements (id, url, status) VALUES (%s, %s, %s)"
    val = (advertisments_id, url, 0)
    my_cursor.execute(sql, val)
    mydb.commit()

# Suche alle Inserats Urls für gesetzte Filter und Anzahl Seiten
def get_advertisements_url(pages, min_price, max_price, min_kw, max_kw, fuel):
    for page in range(1, pages):

        # Build URL
        url = \
            "https://suchen.mobile.de/fahrzeuge/search.html?" \
            "cn=DE&damageUnrepaired=ALSO_DAMAGE_UNREPAIRED" \
            "&fuels=" + str(fuel) + \
            "&grossPrice=true&isSearchRequest=true" \
            "&maxPowerAsArray=" + str(max_kw) + "&maxPowerAsArray=KW" \
                                                "&minPowerAsArray=" + str(min_kw) + "&minPowerAsArray=KW" \
                                                                                    "&maxPrice=" + str(
                max_price) + "&minPrice=" + str(min_price) + \
            "&pageNumber=" + str(page) + "&readyToDrive=ONLY_READY_TO_DRIVE&scopeId=C&sfmr=false"
        print(url)

        # Get URL Data
        header = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'}
        html_content = requests.get(url, headers=header)
        soup = BeautifulSoup(html_content.text, 'html.parser')

        # Find all advertisements links
        i = 0
        for a in soup.find_all('a', href=True):
            if "https://suchen.mobile.de/fahrzeuge/details.html?" in a['href']:
                create_advertisements(a['href'])
                i = i + 1
        print("Ergebnisse: " + str(i))

        # Break if sites do not include any advertisements or just one
        # no need to process next pages
        if i <= 1:
            break



if __name__ == '__main__':

    # Filter Optionen
    pages = 5  # Anzahl Seiten die maximal abgefragt werden
    fuels = ["DIESEL", "PETROL", "LPG"]  # Treibstoff
    price_arr = [0, 5000, 10000, 25000, 50000, 100000, 200000]  # Preis Bereiche
    power_arr = [0, 37, 74, 110, 183, 368]  # KW Bereiche
    #            0  50  100 150  250  500     PS

    # Rufe mit jedem Filter die Abfrage auf
    for price in range(90, 200):  # Preisbereich der Fahrzeuge (Wert * 500)
        for power in range(0, len(power_arr) - 1):  # PS/KW Bereich der Fahrzeuge
            for fuel in fuels:  # Treibstoff
                get_advertisements_url(pages, price * 500, (price + 1) * 500, power_arr[power],
                                       power_arr[power + 1], fuel)
