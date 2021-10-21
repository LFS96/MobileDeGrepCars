# This is a sample Python script.

# Press Umschalt+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import requests
from bs4 import BeautifulSoup
import mysql.connector
from urllib.parse import urlparse
from urllib.parse import parse_qs


def get_mysql_connector():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="mobilede"
    )

def get_url_parameter(url, parameter):
    parsed_url = urlparse(url)
    return parse_qs(parsed_url.query)[parameter][0]

def create_advertisements(url):
    mydb = get_mysql_connector()
    mycursor = mydb.cursor()

    id = get_url_parameter(url, "id")

    sql = "INSERT IGNORE INTO mobilede.advertisements (id, url, status) VALUES (%s, %s, %s)"
    val = (id, url, 0)
    mycursor.execute(sql, val)
    mydb.commit()


def get_advertisements_url():
    for page in range(1, 50):
        url = "https://suchen.mobile.de/fahrzeuge/search.html?" \
              "cn=DE&damageUnrepaired=ALSO_DAMAGE_UNREPAIRED" \
              "&fuels=DIESEL&fuels=PETROL" \
              "&grossPrice=true&isSearchRequest=true&maxPowerAsArray=221&maxPowerAsArray=KW" \
              "&maxPrice=99999" \
              "&pageNumber=" + str(page) + "&readyToDrive=ONLY_READY_TO_DRIVE&scopeId=C&sfmr=false"

        header = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'}
        #  url = "https://www.hybrid-analysis.com/recent-submissions?filter=file&sort=^timestamp"
        htmlContent = requests.get(url, headers=header)
        soup = BeautifulSoup(htmlContent.text, 'html.parser')
        for a in soup.find_all('a', href=True):
            if "https://suchen.mobile.de/fahrzeuge/details.html?" in a['href']:
                create_advertisements(a['href'])


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    get_advertisements_url()
