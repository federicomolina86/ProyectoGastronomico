-- Creación de la base de datos (si no existe ya)
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Restaurante')
BEGIN
    CREATE DATABASE Restaurante;
END
GO

-- Seleccionar la base de datos a usar
USE Restaurante;

-- Creación de tablas de dimensiones
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'categoriaProductos')
BEGIN
    CREATE TABLE categoriaProductos (
        id_categoria INT PRIMARY KEY IDENTITY(1,1),
        nombreCategoria NVARCHAR(50) NOT NULL
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'productos')
BEGIN
    CREATE TABLE productos (
        id_producto INT PRIMARY KEY IDENTITY(1,1),
        nombreProducto NVARCHAR(50) NOT NULL,
        precio INT NOT NULL,
		id_categoria INT NOT NULL
		 FOREIGN KEY (id_categoria) REFERENCES categoriaProductos(id_categoria)
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'empleados')
BEGIN
    CREATE TABLE empleados (
        id_empleado INT PRIMARY KEY IDENTITY(1,1),
        nombreEmpleado NVARCHAR(50) NOT NULL
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'mesas')
BEGIN
    CREATE TABLE mesas (
        id_mesa INT PRIMARY KEY IDENTITY(1,1),
        sector NVARCHAR(50) NOT NULL
    );
END

-- Creación de tabla 'calendario'
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'calendario')
BEGIN
CREATE TABLE calendario (
    id_calendario INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE NOT NULL,
    hora INT NOT NULL,
    dia INT NOT NULL,
    mes INT NOT NULL,
    anio INT NOT NULL,
    dia_semana NVARCHAR(20) NOT NULL,
    nombre_mes NVARCHAR(20) NOT NULL,
    trimestre INT NOT NULL
);
END

-- Creación de la tabla de hechos
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ventas')
BEGIN
    CREATE TABLE ventas (
        id_venta INT PRIMARY KEY IDENTITY(1,1),
		nro_transaccion INT NOT NULL,
		id_producto INT NOT NULL,
        fecha_venta DATE NOT NULL,
        hora_venta TIME NOT NULL,
		precio INT NOT NULL,
        cantidad INT NOT NULL,
        id_empleado INT NOT NULL,
		id_mesa INT NOT NULL,
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
        FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
		FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa)
);
END