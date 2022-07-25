-- �Cu�l es el nombre aeropuerto que ha tenido mayor movimiento durante el a�o?
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

 -- �Cu�l es el nombre aerol�nea que ha realizado mayor n�mero de vuelos durante el a�o?
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
 FROM [Tabla de aerol�neas]
 ) b  ON a.ID_AEROLINEA = b.ID_AEROLINEA;

 -- �En qu� d�a se han tenido mayor n�mero de vuelos?
SELECT DIA, COUNT(DIA) VUELOS
    FROM [Tabla de vuelos]  GROUP BY DIA
    HAVING COUNT (DIA)=( 
    SELECT MAX(VUELOS) 
    FROM ( 
    SELECT DIA, COUNT(DIA) VUELOS
    FROM [Tabla de vuelos] 
    GROUP BY DIA)a);

