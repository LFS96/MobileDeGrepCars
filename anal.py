import requests
from bs4 import BeautifulSoup
import mysql.connector
from urllib.parse import urlparse
from urllib.parse import parse_qs
from findNewAdvertisments import get_mysql_connector

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
    print(soup.find("span", {"class": "h3", "data-testid": "prime-price"}).get_text())      # Preis
    print(soup.find("div", {"class": "g-col-6", "id": "damageCondition-v"}).get_text())     # Fahrzeugzustand
    print(soup.find("div", {"class": "g-col-6", "id": "mileage-v"}).get_text())             # Laufleistung
    print(soup.find("div", {"class": "g-col-6", "id": "cubicCapacity-v"}).get_text())       # Hubraum
    print(soup.find("div", {"class": "g-col-6", "id": "power-v"}).get_text())               # Leistung
    print(soup.find("div", {"class": "g-col-6", "id": "fuel-v"}).get_text())                # Treibstoff Art
    print(soup.find("div", {"class": "g-col-6", "id": "envkv.emission-v"}).get_text())      # CO2
    print(soup.find("div", {"class": "g-col-6", "id": "transmission-v"}).get_text())        # Schaltung
    print(soup.find("div", {"class": "g-col-6", "id": "firstRegistration-v"}).get_text())   # Erstzulassung

    verbrauch_html = soup.find("div", {"class": "g-col-6", "id": "envkv.consumption-v"})
    verbrauch_soup = BeautifulSoup(str(verbrauch_html), 'html.parser')
    for v in verbrauch_soup.find_all("div", {"class": "u-margin-bottom-9"}):
        print(v.get_text())                                                                 # Verbrauch

    feature_html = soup.find("div", {"class": "cBox-body", "id": "features"})
    feature_soup = BeautifulSoup(str(feature_html), 'html.parser')
    for f in feature_soup.find_all("div", {"class": "bullet-list"}):
        print(f.get_text())                                                                 # Features

    print(soup.find("div", {"class": "description"}).get_text())                            # Beschreibung laut Hersteller



def find_db_entry():
    print("xxx")

if __name__ == '__main__':
    anal_html(280100679)
