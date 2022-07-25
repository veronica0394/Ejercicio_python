-- ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?
SELECT *
 FROM
 (
  SELECT ID_AEROPUERTO, COUNT(ID_AEROPUERTO) MAYOR
    FROM [Tabla de vuelos]  GROUP BY ID_AEROPUERTO
    HAVING COUNT(ID_AEROPUERTO)=( 
 SELECT MAX(MAYOR) 
    FROM( 
    SELECT ID_AEROPUERTO, COUNT(ID_AEROPUERTO) MAYOR
    FROM [Tabla de vuelos] 
    GROUP BY ID_AEROPUERTO)a)
 ) a 
 INNER JOIN 
 (
  SELECT NOMBRE_AEROPUERTO , ID_AEROPUERTO
 FROM [Tabla aeropuertos] 
 ) b  ON a.ID_AEROPUERTO = b.ID_AEROPUERTO;

 -- ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
SELECT *
 FROM
 (
 SELECT ID_AEROLINEA, COUNT(ID_AEROLINEA) MAYOR
    FROM [Tabla de vuelos] GROUP BY ID_AEROLINEA
    HAVING COUNT (ID_AEROLINEA) = ( 
    SELECT MAX(MAYOR) 
    FROM ( 
    SELECT ID_AEROLINEA, COUNT(ID_AEROLINEA) MAYOR
    FROM [Tabla de vuelos] 
    GROUP BY ID_AEROLINEA)a)
 ) a 
 INNER JOIN
 (
  SELECT NOMBRE_AEROLINEA , ID_AEROLINEA
 FROM [Tabla de aerolíneas]
 ) b  ON a.ID_AEROLINEA = b.ID_AEROLINEA;

 -- ¿En qué día se han tenido mayor número de vuelos?
SELECT DIA, COUNT(DIA) VUELOS
    FROM [Tabla de vuelos]  GROUP BY DIA
    HAVING COUNT (DIA)=( 
    SELECT MAX(VUELOS) 
    FROM ( 
    SELECT DIA, COUNT(DIA) VUELOS
    FROM [Tabla de vuelos] 
    GROUP BY DIA)a);

