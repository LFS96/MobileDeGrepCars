import requests
from bs4 import BeautifulSoup
import mysql.connector
from urllib.parse import urlparse
from urllib.parse import parse_qs
from findNewAdvertisments import get_mysql_connector
import datetime
import re

def get_data(num):
    mydb = get_mysql_connector()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT raw FROM mobilede.advertisements WHERE id = " + str(num))
    myresult = mycursor.fetchall()
    for x in myresult:
        return x[0]

def anal_html(num):
    html = get_data(num)
    soup = BeautifulSoup(html, 'html.parser')

    print(soup.find('title').get_text())                                                    # Title

    preis = int("".join(filter(str.isdigit, soup.find("span", {"class": "h3", "data-testid": "prime-price"}).get_text())))
    fahrzeugzustand = soup.find("div", {"class": "g-col-6", "id": "damageCondition-v"}).get_text()
    laufleistung = int("".join(filter(str.isdigit, soup.find("div", {"class": "g-col-6", "id": "mileage-v"}).get_text())))
    hubraum = int("".join(filter(str.isdigit, soup.find("div", {"class": "g-col-6", "id": "cubicCapacity-v"}).get_text()))[:-1])
    leistung = int(soup.find("div", {"class": "g-col-6", "id": "power-v"}).get_text().split()[0])
    treibstoff = soup.find("div", {"class": "g-col-6", "id": "fuel-v"}).get_text()
    CO2 = int("".join(filter(str.isdigit, soup.find("div", {"class": "g-col-6", "id": "envkv.emission-v"}).get_text())))
    schaltung = soup.find("div", {"class": "g-col-6", "id": "transmission-v"}).get_text()
    erstzulassung = datetime.datetime.strptime(soup.find("div", {"class": "g-col-6", "id": "firstRegistration-v"}).get_text(), "%m/%Y").date()
    description = soup.find("div", {"class": "description"}).get_text()

    i = 0
    verbrauch_kombiniert = verbrauch_innerorts = verbrauch_ausserorts = 0
    for v in BeautifulSoup(str(soup.find("div", {"class": "g-col-6", "id": "envkv.consumption-v"})), 'html.parser').find_all("div", {"class": "u-margin-bottom-9"}):
        if i == 0:
            verbrauch_kombiniert = float(v.get_text()[4:-20].replace(",", "."))
        if i == 1:
            verbrauch_innerorts = float(v.get_text()[4:-19].replace(",", "."))
        if i == 2:
            verbrauch_ausserorts = float(v.get_text()[4:-19].replace(",", "."))
        i += 1

    features = []
    for f in BeautifulSoup(str(soup.find("div", {"class": "cBox-body", "id": "features"})), 'html.parser').find_all(
            "div", {"class": "bullet-list"}):
        features.append(f.get_text())

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



def find_db_entry():
    print("xxx")

if __name__ == '__main__':
    anal_html(280100679)
