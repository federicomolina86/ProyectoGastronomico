USE Restaurante;

BULK INSERT Ventas
FROM 'D:\Documents\PC\Fede\Proyectos\Restaurante\Ventas - 2024-05-12.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
	)

SELECT * FROM Ventas;
