-- Creacion de tablas (DDL)

CREATE TABLE clasificacion_superior (
	codigo integer,
	reino varchar(40),
	filio varchar(40),
	clase varchar(40),
	orden varchar(40),
	familia varchar(40),
	PRIMARY KEY (codigo)
);

CREATE TABLE informacion_taxonomica (
	id_taxonomia varchar(40),
	estado_taxonomico varchar(40),
	observacion_taxonomica varchar(80),
	rango_taxonomico varchar(40),
	codigo_clasificacion integer,
	PRIMARY KEY (id_taxonomia), 
	FOREIGN KEY (codigo_clasificacion) REFERENCES clasificacion_superior
);

CREATE TABLE intraespecificidad_epiteto (
	codigo_int integer,
	genero varchar(40),
	epiteto_especifico varchar(40),
	epiteto_intraespecifico varchar(40),
	nombre_vernaculo varchar(60),
	codigo integer,
	PRIMARY KEY (codigo_int),
	FOREIGN KEY (codigo) REFERENCES clasificacion_superior
);

CREATE TABLE especies_amenazadas (
	id_nomenclatura varchar(40),
	estado_de_amenaza varchar(40),
	codigo_int integer,
	PRIMARY KEY (id_nomenclatura),
	FOREIGN KEY (codigo_int) REFERENCES intraespecificidad_epiteto
);


-- Carga de datos masiva para clasificacion_superior

COPY public.clasificacion_superior (codigo, reino, filio, clase, orden, familia)
FROM 'C:\Users\manue\Desktop\pr_datos\implementacion_db\csvs\T_clasificacion_superior.csv'
DELIMITER ';' CSV HEADER

-- Utilizando \copy en lugar de COPY
copy public.clasificacion_superior (codigo, reino, filio, clase, orden, familia) 
FROM 'C:/Users/manue/Desktop/pr_datos/implementacion_db/csvs/T_clasificacion_superior.csv' 
DELIMITER ';' CSV HEADER;