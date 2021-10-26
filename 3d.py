from mpl_toolkits import mplot3d
import numpy as np
import matplotlib.pyplot as plt
from findNewAdvertisments import get_mysql_connector

def figure3d():
    fig = plt.figure()
    ax = plt.axes(projection='3d')

    # Data for a three-dimensional line

    mydb = get_mysql_connector()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT price, mileage, power FROM mobilede.cars ORDER BY rand() LIMIT 1000")
    myresult = mycursor.fetchall()
    for x in myresult:
        ax.scatter(x[0], x[1], x[2])


    plt.show()

if __name__ == '__main__':
    figure3d()
