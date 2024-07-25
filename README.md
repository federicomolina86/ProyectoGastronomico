# Análisis de Datos de Empresa Gastronómica

![](https://github.com/federicomolina86/ProyectoGastronomico/blob/main/src/Rest.jpg)


## Características
- Este proyecto es parte de un trabajo freelance que estoy realizando para un restaurante de mi provincia, propiedad de un amigo.
- Él me provee sus datos de cada venta de comida realizada, incluyendo fecha, hora, nombre del empleado, productos y mesa (en formato papel, así que debo realizar la ingesta manual de datos).
- Mi trabajo es proporcionarle insights valiosos para que pueda centrar sus esfuerzos y estrategias principalmente en los días, horarios y productos (entre otras cosas) en los cuales la venta es menor.


## Fases del Análisis de Datos (hasta la fecha)

### 1. Preguntas
En esta fase, se formularon algunas preguntas clave de mi parte para conocer un poco más sobre la empresa y su funcionamiento. Inmediatamente le pedí al cliente que me preguntara e indicara qué cosas le gustaría saber sobre los datos que me proporcionaba y le sugerí algunas preguntas a responder con el análisis de datos. Algunas de las preguntas que guían este proyecto son:

- ¿Cuáles son los ingresos durante los últimos 60 días?
- ¿Cuáles son los platos más vendidos?
- ¿Cuál es el rendimiento de los empleados en términos de ventas?
- ¿Qué categorías de productos venden más platos?
- ¿Cómo varían las ventas a lo largo del día?
- ¿Qué rangos de precios son los más populares entre los clientes?


### 2. Preparación
La preparación de los datos implica la recolección de todos los datos relevantes necesarios para el análisis. Para este proyecto, los datos fueron ingestados por mí a través del registro en formato papel de cada comanda que imprime el sistema PDV. De ellas se pudo obtener:

- Fecha y hora de la venta.
- Empleado que realizó la venta.
- Productos vendidos.
- Número de mesa.

También tuve acceso a la carta impresa para obtener el precio de los productos y poder categorizar cada producto.


### 3. Limpieza y Organización de Datos

En esta fase, los datos recolectados se limpian y organizan para asegurar su calidad y consistencia. En este caso, los archivos .csv que contienen los registros fueron creados por mí, por lo tanto fueron corroborados luego de su creación y en la ingesta a las tablas también se corrigieron algunos errores de ':' y ','. Las actividades realizadas durante la ingesta incluyen:

- Creación de tablas y relaciones en una base de datos SQL Server.
- Creación de archivos .csv para cada tabla de dimensiones.
- Completar cada archivo con los datos proporcionados por las comandas y la carta.
- Normalización temprana de datos (antes de ingestarlos, ya estaban los datos normalizados siguiendo las relaciones entre tablas).


### 4. Análisis



## Tecnologías utilizadas
- `SQL Server`
- `Power BI`
- `Visual Studio Code`
- `Notepad++`

## Archivos y carpetas incluidos
- `CSV Ventas`: archivos .csv con las ventas de cada día y diccionario de datos.
- `CSV dim`: archivos .csv con los registros de las tablas de dimensiones y diccionarios de datos.
- `Scripts`: archivos .sql e .ipynb con códigos en SQL y Python, ultilizados para creación de la base de datos, tablas, registros y consultas sobre algunas preguntas del cliente.
- `src`: carpeta con imágenes del repositorio.
- `README.md`: archivo README del repositorio.

## Contribuciones
- Cualquiera que quiera darme algún consejo o modificaciones que ayuden al proyecto, estaré muy agradecido. Comunicarse por favor a:
    - https://www.linkedin.com/in/matias-federico-molina/
    - federicomolina86@gmail.com

## Licencia
- Estos datos y los resultados obtenidos me permitieron ser usados y publicados libremente, siempre y cuando no incluya ninguna mención u otra cosa que  lo relacione con la empresa. 
