USE mobilede;

# Tabelle 'data' entspricht dem Datensatz 'daten.xlsx'
CREATE TABLE data_zip (
SELECT d.*, zc.lat, zc.lon
FROM data d
JOIN zip_loc zc ON d.city = zc.zipcode);

# für CSV-Export relevante Spalten selektieren
SELECT price, lat, lon FROM data_zip;

# Skripte zum Generieren der 'price-average'-Tabelle (nach Ausstattungsmerkmal)
CREATE TABLE IF NOT EXISTS price_average (feature VARCHAR(5), price DECIMAL(8,2), count INT)

WITH column_names AS (SELECT COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'mobilede'
      AND TABLE_NAME = 'data')
SELECT GROUP_CONCAT('INSERT INTO price_average (feature, price, count) SELECT \'', COLUMN_NAME, '\', AVG(price), COUNT(*) AS price FROM data WHERE ', COLUMN_NAME, ' = 1;')
FROM column_names WHERE COLUMN_NAME LIKE BINARY 'F%'
GROUP BY COLUMN_NAME;

