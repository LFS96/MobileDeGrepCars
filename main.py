# This is a sample Python script.

# Press Umschalt+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import requests
from bs4 import BeautifulSoup


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Strg+F8 to toggle the breakpoint.


def downloadPage():
    for page in range(1, 50):
        url = "https://suchen.mobile.de/fahrzeuge/search.html?" \
              "cn=DE&damageUnrepaired=ALSO_DAMAGE_UNREPAIRED" \
              "&fuels=DIESEL&fuels=PETROL" \
              "&grossPrice=true&isSearchRequest=true&maxPowerAsArray=221&maxPowerAsArray=KW" \
              "&maxPrice=99999" \
              "&pageNumber=" + str(page) + "&readyToDrive=ONLY_READY_TO_DRIVE&scopeId=C&sfmr=false"

        header = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'}
        print(header)
        #  url = "https://www.hybrid-analysis.com/recent-submissions?filter=file&sort=^timestamp"
        htmlContent = requests.get(url, headers=header)
        print(htmlContent)
        soup = BeautifulSoup(htmlContent.text, 'html.parser')
        for a in soup.find_all('a', href=True):
            if "https://suchen.mobile.de/fahrzeuge/details.html?" in a['href']:
                print("Found the URL:", a['href'])


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    downloadPage()
