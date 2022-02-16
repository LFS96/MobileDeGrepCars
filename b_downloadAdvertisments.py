import requests

from a_findNewAdvertisments import get_mysql_connector


# Schreibt Seitenquelltext in die Datenbank
def update_advertisements(a_id, data):
    # Write url to advertisements Table
    mydb = get_mysql_connector()
    my_cursor = mydb.cursor()

    sql = "UPDATE mobilede.advertisements SET raw = %s, status = %s WHERE id = %s"
    val = (data, 1,  a_id)

    my_cursor.execute(sql, val)
    mydb.commit()

# Download des Quelltext einer gegebenen URL
def downloadUrl(url):
    #print(url)
    header = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0'}
    html_content = requests.get(url, headers=header)
    return html_content.text


# Downloaded den Webseiten-Quelltext der nächsten X Urls aus der Datenbank, die noch nicht verarbeitet wurden.
def get_next_advertisements(numbers):
    mydb = get_mysql_connector()
    mycursor = mydb.cursor()

    mycursor.execute("SELECT * FROM mobilede.advertisements WHERE status = 0 LIMIT "+str(numbers))

    myresult = mycursor.fetchall()
    i = 0
    for x in myresult:
        i += 1
        a_id = x[0]
        url = x[1]
        print(str(i) + " - " + url)
        html = downloadUrl(url)
        update_advertisements(a_id, html)


if __name__ == '__main__':
    get_next_advertisements(120000)
