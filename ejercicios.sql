-- 1. Selecciona los nombres de todos los productos de la tienda.
SELECT * FROM Products;

-- 2. Selecciona los nombres y los precios de todos los productos de la tienda.
SELECT
Name,
Price
FROM Products;

-- 3. Selecciona el nombre de los productos con un precio menor o igual a $200.
SELECT
Name,
Price
FROM Products
WHERE Price <= 200;

-- 4. Selecciona todos los productos con un precio entre $60 y $120.
-- #opcion 1
SELECT
*
FROM Products 
WHERE Price >= 60 AND Price<=120;
-- #opcion 2
SELECT * FROM Products
WHERE Price BETWEEN 60 AND 120;

-- 5.Seleccione el nombre y el precio multiplicado por 100.
SELECT
Name,
Price,
Price*100 as Price_100
FROM Products;

-- 6. Calcule el precio promedio de todos los productos.
-- opcion1 
SELECT
AVG(Price) as promedio
FROM Products;
-- opcion2
-- SELECT
-- AVG(Price) as promedio
-- FROM Products
-- WHERE Price >=100;

-- 7. Calcule el precio promedio de todos los productos con código de fabricante igual a 2.
SELECT
AVG(Price) as promedio
FROM Products
WHERE Manufacturer=2;

-- 8. Calcule el número de productos con un precio mayor o igual a $180.
SELECT
COUNT(Name) as cantidad
FROM Products
WHERE Price>=180;

-- 9. Selecciona el nombre y el precio de todos los productos con un precio mayor o igual a $180 y ordena primero por precio (en orden descendente) y luego por nombre (en orden ascendente).
SELECT
Name,
Price
FROM Products
WHERE Price >= 180
ORDER BY Price DESC, Name ASC;

-- 10. Seleccione todos los datos de los productos, incluidos todos los datos del fabricante de cada producto.
SELECT
*
FROM Products as p
LEFT JOIN Manufacturers as m on p.Manufacturer = m.Code;

-- 11. Seleccione el nombre del poducto, el precio y el nombre del fabricante de todos los productos.
SELECT
p.Name,
Price,
m.Name
FROM Products as p
LEFT JOIN Manufacturers as m on p.Manufacturer = m.Code;

-- 12. Seleccione el precio promedio de los productos de cada fabricante, mostrando solo el código del fabricante
SELECT
Manufacturer,
AVG(Price) as promedio_precio
FROM computer_store.Products
GROUP BY Manufacturer;

-- 13. Seleccione el precio promedio de los productos de cada fabricante, mostrando el nombre del fabricante.
SELECT
  m.Name as nombre_fabricante,
  SUM(Price) as suma_precio
  FROM computer_store.Products p
  LEFT JOIN Manufacturers m on m.Code = p.Manufacturer
  GROUP BY nombre_fabricante;

-- 14.Seleccione los nombres de los fabricantes cuyos productos tienen un precio promedio mayor o igual a $150.
SELECT
AVG(Price) AS precio_promedio
FROM Manufacturers m
LEFT JOIN Products p on p.Manufacturer = m.Code
HAVING AVG(Price) > 150

-- 15. Seleccione el nombre y el precio del producto más barato.
SELECT
Name,
Price
FROM Products
ORDER BY Price ASC
LIMIT 1

-- 16. Seleccione el nombre de cada fabricante que tenga un precio promedio superior a $145 y contenga al menos 2 productos diferentes.
SELECT
m.Name,
COUNT(p.Code) as cantidad_productos,
AVG(Price) as precio_promedio
FROM Manufacturers m
LEFT JOIN Products p on p.Manufacturer = m.Code
GROUP BY m.Name
HAVING AVG(Price)> 145 AND COUNT(p.Code) >1

-- 17. Agregue un nuevo producto a la tabla de productos: Altavoces, $70, fabricante 2.
INSERT INTO computer_store.Products VALUES(11, 'Altavoces',70,2)

-- 18. Actualice el nombre del producto 8 a "Impresora láser".
UPDATE computer_store.Products
SET Name = 'Impresora laser'
WHERE Code = 8;

SELECT *
FROM computer_store.Products
WHERE Code = 8

-- 19. Actualiza la tabla de productos y aplica un 10% de descuento en todos los productos.
SELECT
*,
Price * 0.9 as precio_10_menos
FROM Products

UPDATE Products
SET Price = Price * 0.9;

-- 20. Actualiza la tabla de productos Aplica un 10% de descuento a todos los productos con un precio mayor o igual a $120.
SELECT
*,
Price * 0.9 as precio_10_menos
FROM Products
WHERE Price >=120

UPDATE Products
SET Price = Price * 0.9
WHERE Price >=120;