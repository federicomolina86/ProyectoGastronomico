USE Restaurante;

-- Insertar registros a la tabla 'categoriaProductos'
BULK INSERT categoriaProductos
FROM 'D:\Documents\PC\Fede\Proyectos\Restaurante\CategoriaProductos.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
	)

SELECT * FROM categoriaProductos;

-- Insertar registros a la tabla 'Productos'
BULK INSERT Productos
FROM 'D:\Documents\PC\Fede\Proyectos\Restaurante\Productos.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
	)

SELECT * FROM Productos;

-- Insertar registros a la tabla 'calendario'
BULK INSERT Calendario
FROM 'D:\Documents\PC\Fede\Proyectos\Restaurante\calendar.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
	)

SELECT * FROM calendario;

-- Insertar registros a la tabla 'calendario'
INSERT INTO empleados(nombreEmpleado)
VALUES 
('David'),
('Martín'),
('PedidosYa'),
('Pablo'),
('Enrique'),
('Kevin'),
('Maximiliano'),
('Santiago'),
('Emanuel'),
('Fernando'),
('Francisco');

SELECT * FROM empleados;