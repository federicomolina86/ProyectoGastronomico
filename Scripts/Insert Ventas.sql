USE Restaurante;

BULK INSERT Ventas
FROM 'D:\Documents\PC\Fede\Proyectos\Restaurante\nombreDelArchivo.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
	)

SELECT * FROM Ventas;
