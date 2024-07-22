USE Restaurante;

-- ANÁLISIS DE VENTAS
-- Ingresos totales en el último periodo de 60 días
SELECT SUM(precio*cantidad) AS 'Ingresos totales',
SUM(cantidad) AS 'Cantidad de platos',
SUM(precio*cantidad) / SUM(cantidad) AS 'Precio promedio'
FROM Ventas;

-- Ingresos por mes
SELECT
    CASE
        WHEN fecha_venta BETWEEN '2024-05-12' AND '2024-06-11' THEN '12/05/24 al 11/06/24'
        WHEN fecha_venta BETWEEN '2024-06-12' AND '2024-07-11' THEN '12/06/24 al 11/07/24'
    END AS Periodo,
    SUM(precio * cantidad) AS 'Venta Total'
FROM ventas
WHERE fecha_venta BETWEEN '2024-05-12' AND '2024-07-11'
GROUP BY 
    CASE
        WHEN fecha_venta BETWEEN '2024-05-12' AND '2024-06-11' THEN '12/05/24 al 11/06/24'
        WHEN fecha_venta BETWEEN '2024-06-12' AND '2024-07-11' THEN '12/06/24 al 11/07/24'
    END
ORDER BY Periodo ASC;

-- Ventas según precio
SELECT 
    CASE 
        WHEN precio BETWEEN 0 AND 2500 THEN '$0 a $2500'
        WHEN precio BETWEEN 2501 AND 7500 THEN '$2501 a $7500'
        WHEN precio BETWEEN 7501 AND 10500 THEN '$7501 a $10500'
        WHEN precio BETWEEN 10501 AND 16250 THEN '$10501 a $16250'
        WHEN precio BETWEEN 16251 AND 24500 THEN '$16251 a $24500'
    END AS Rango,
    SUM(cantidad) AS Cantidad
FROM 
    ventas
GROUP BY 
    CASE 
        WHEN precio BETWEEN 0 AND 2500 THEN '$0 a $2500'
        WHEN precio BETWEEN 2501 AND 7500 THEN '$2501 a $7500'
        WHEN precio BETWEEN 7501 AND 10500 THEN '$7501 a $10500'
        WHEN precio BETWEEN 10501 AND 16250 THEN '$10501 a $16250'
        WHEN precio BETWEEN 16251 AND 24500 THEN '$16251 a $24500'
    END
ORDER BY 
    Cantidad DESC;


--ANÁLISIS DE EMPLEADOS
-- Venta total por empleado
SELECT e.nombreEmpleado AS 'Nombre del empleado',
SUM(v.precio*v.cantidad) AS 'Venta'
FROM empleados e
INNER JOIN ventas v
ON e.id_empleado = v.id_empleado
GROUP BY e.nombreEmpleado
ORDER BY [Venta] DESC;

-- Venta promedio por día
SELECT e.nombreEmpleado AS 'Nombre del empleado',
SUM(v.precio*v.cantidad) / COUNT(DISTINCT v.fecha_venta) AS 'Venta diaria promedio',
COUNT(DISTINCT v.fecha_venta) AS 'Días trabajados',
SUM(v.precio*v.cantidad) AS 'Venta'
FROM empleados e
INNER JOIN ventas v
ON e.id_empleado = v.id_empleado
GROUP BY nombreEmpleado
ORDER BY 'Venta diaria promedio' DESC;

--Venta de platos por mozo
WITH VentasPorMozo AS (
    SELECT
        e.nombreEmpleado AS NombreEmpleado,
        p.nombreProducto AS NombreProducto,
        SUM(v.cantidad) AS CantidadVendida,
        ROW_NUMBER() OVER (PARTITION BY e.nombreEmpleado ORDER BY SUM(v.cantidad) DESC) AS Rn
    FROM 
        productos p
    JOIN 
        ventas v ON p.id_producto = v.id_producto
    JOIN 
        empleados e ON e.id_empleado = v.id_empleado
    WHERE 
        e.nombreEmpleado IN ('Pablo', 'Martín', 'Maximiliano', 'Kevin', 'David')
    GROUP BY 
        e.nombreEmpleado, p.nombreProducto
)
SELECT 
    NombreEmpleado,
    STRING_AGG(NombreProducto + ': ' + CAST(CantidadVendida AS VARCHAR), ' -- ') WITHIN GROUP (ORDER BY CantidadVendida DESC) AS 'Productos más vendidos'
FROM 
    VentasPorMozo
WHERE 
    Rn <= 7
GROUP BY 
    NombreEmpleado;


-- ANÁLISIS DE PRODUCTOS
-- Productos más vendidos
SELECT TOP 15
p.nombreProducto AS 'Nombre del producto',
SUM(v.cantidad) AS 'Cantidad vendida'
FROM productos p
JOIN ventas v ON p.id_producto = v.id_producto
GROUP BY nombreProducto
ORDER by 'Cantidad vendida' DESC;

-- Categorías predominantes
SELECT TOP 5
c.nombreCategoria AS 'Categoría de producto',
SUM(v.cantidad) AS 'Cantidad vendida'
FROM categoriaProductos c
JOIN productos p ON c.id_categoria = p.id_categoria
JOIN ventas v ON p.id_producto = v.id_producto
GROUP BY c.nombreCategoria
ORDER by 'Cantidad vendida' DESC;


-- ANÁLISIS DE TIEMPO
--Ventas por día de la semana
SELECT 
    CASE DATENAME(WEEKDAY, fecha_venta) 
		WHEN 'Monday' THEN 'Lunes'
        WHEN 'Tuesday' THEN 'Martes'
        WHEN 'Wednesday' THEN 'Miércoles'
        WHEN 'Thursday' THEN 'Jueves'
        WHEN 'Friday' THEN 'Viernes'
        WHEN 'Saturday' THEN 'Sábado'
        WHEN 'Sunday' THEN 'Domingo'
    END AS Día,
    SUM(precio * cantidad) AS 'Venta'
FROM ventas
GROUP BY DATENAME(WEEKDAY, fecha_venta)
ORDER BY 'Venta' DESC;

-- Cantidad de platos por día de la semana
SELECT 
    CASE DATENAME(WEEKDAY, fecha_venta) 
		WHEN 'Monday' THEN 'Lunes'
        WHEN 'Tuesday' THEN 'Martes'
        WHEN 'Wednesday' THEN 'Miércoles'
        WHEN 'Thursday' THEN 'Jueves'
        WHEN 'Friday' THEN 'Viernes'
        WHEN 'Saturday' THEN 'Sábado'
        WHEN 'Sunday' THEN 'Domingo'
    END AS Día,
    SUM(cantidad) AS 'Cantidad de platos'
FROM ventas
GROUP BY DATENAME(WEEKDAY, fecha_venta)
ORDER BY 'Cantidad de platos' DESC;

-- Cantidad de ventas según hora
SELECT  DATEPART(HOUR, hora_venta) AS Hora,
		COUNT(DISTINCT nro_transaccion) AS 'Cantidad de transacciones'
FROM Ventas
GROUP BY DATEPART(HOUR, hora_venta)
ORDER BY 'Cantidad de transacciones' DESC;


-- ANALISIS DE LA OCUPACIÓN
-- Mesas menos usadas
SELECT TOP 10
id_mesa AS 'Número de mesa',
COUNT(distinct nro_transaccion) AS 'Cantidad de veces usada'
FROM Ventas
GROUP BY id_mesa
ORDER BY 'Cantidad de veces usada' ASC;
