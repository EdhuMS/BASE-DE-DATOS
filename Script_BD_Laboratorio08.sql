--ACTIVANDO LA BASE DE DATOS DEL SISTEMA
USE MASTER;
GO

--VALIDAR SI LA BASE DE DATOS EXISTE. DE SER EL CASO, LO ELIMINA
IF DB_ID('BDAlquiler') IS NOT NULL
	DROP DATABASE BDAlquiler;
GO

--CREANDO LA BASE DE DATOS
CREATE DATABASE BDAlquiler;
GO

--ACTIVANDO LA BASE DE DATOS
USE BDAlquiler;
GO

--CAMBIANDO EL FORMATO DE LA FECHA DE INGRESO DE DATOS
SET DATEFORMAT DMY;
GO

-- CREAMOS LAS TABLAS

CREATE TABLE TB_Marca(
cod_marca int not null,
nom_marca varchar(20),
fec_ing date,
pais_proc varchar(20),
PRIMARY KEY (cod_marca)
);

GO
CREATE TABLE TB_Automovil(
cod_auto int not null PRIMARY KEY,
modelo_auto varchar(20),
fec_auto date,
color_auto varchar(20),
precio_auto decimal(7,2),
cod_marca int FOREIGN KEY REFERENCES TB_Marca
);
GO

CREATE TABLE TB_Cliente(
cod_cli int not null PRIMARY KEY,
nom_cli varchar(30),
ape_pat_cli varchar(30),
ape_mat_cli varchar(30),
fec_nac_cli date,
tipo_cli varchar(30)
);
GO
CREATE TABLE TB_Alquiler(
cod_auto int not null FOREIGN KEY REFERENCES TB_Automovil,
cod_cli int not null FOREIGN KEY REFERENCES TB_Cliente,
fec_ini_asig date,
fec_fin_asig date,
PRIMARY KEY (cod_auto,cod_cli)
);
GO

-- Agregamos el campo dirección y email a la tabla TB_Cliente
ALTER TABLE TB_Cliente ADD direccion varchar(65);
GO
ALTER TABLE TB_Cliente ADD email varchar(40);

GO
-- Eliminamos el campo fec_nac_cli de la tabla TB_Cliente
ALTER TABLE TB_Cliente DROP COLUMN fec_nac_cli;

GO
-- Insertamos registros a la tabla 
INSERT INTO TB_Marca VALUES (1,'KIA','09-02-2019','Korea');
INSERT INTO TB_Marca VALUES (2,'Hyundai','22-12-2017','Korea');
INSERT INTO TB_Marca VALUES (3,'Toyota','30-01-2014','Japon');
INSERT INTO TB_Marca VALUES (4,'Nissan','17-07-2019','Japon');
INSERT INTO TB_Marca VALUES (5,'Ford','23-09-2015','EEUU');
INSERT INTO TB_Marca VALUES (6,'Wolkswagen','19-04-2018','Alemania');
INSERT INTO TB_Marca VALUES (7,'Peugeot','26-12-2016','Francia');

GO
INSERT INTO TB_Automovil VALUES (100,'Sportage','10/05/2024','Rojo',23000,1);
INSERT INTO TB_Automovil VALUES (101,'Sorento','11/02/2023','Negro',25000,1);
INSERT INTO TB_Automovil VALUES (102,'Elantra','22/11/2022','Naranja',19000,2);
INSERT INTO TB_Automovil VALUES (103,'Tucson','18/03/2022','Verde',23500,2);
INSERT INTO TB_Automovil VALUES (104,'Corolla','07/01/2020','Azul',16000,3);
INSERT INTO TB_Automovil VALUES (105,'CX5','02/02/2021','Celeste',22500,3);
INSERT INTO TB_Automovil VALUES (106,'Sentra','27/11/2021','Blanco',16000,4);
INSERT INTO TB_Automovil VALUES (107,'Altima','19/07/2021','Vino',19000,4);
INSERT INTO TB_Automovil VALUES (108,'F-150','10/11/2022','Azul',21000,5);
INSERT INTO TB_Automovil VALUES (109,'Mustang','15/05/2021','Azul',23000,5);

GO
INSERT INTO TB_Cliente VALUES (1000,'Aldo','Corzo','Morales','Potencial','Av. Las Gaviotas 222','aldo@gmail.com');
INSERT INTO TB_Cliente VALUES (1001,'Paolo','Guerrero','Farfan','Esporádico','Av. A.A.Cáceres 333','paolo@gmail.com');
INSERT INTO TB_Cliente VALUES (1002,'Christian','Cueva','Canales','Potencial','Av. Yauyos 444','cueva@gmail.com');
INSERT INTO TB_Cliente VALUES (1003,'Claudio','Pizarro','Llaque','Potencial','Av. San Miguel 555','claudio@hotmail.com');
INSERT INTO TB_Cliente VALUES (1004,'Andy','Polo','Varillas','Esporádico','Jr. San José 666','andy@gmail.com');
INSERT INTO TB_Cliente VALUES (1005,'Raul','Ruidíaz','Morales','Regular','Calle Jpsé Olaya 777','raul@gmail.com');
INSERT INTO TB_Cliente VALUES (1006,'André','Carrillo','Soto','Regular','Calle Los Andes 888','andre@hotmail.com');

GO
INSERT INTO TB_Alquiler VALUES (109, 1000, '22/10/2024','24/10/2024');
INSERT INTO TB_Alquiler VALUES (108, 1000, '27/10/2024','29/10/2024');
INSERT INTO TB_Alquiler VALUES (108, 1001, '02/11/2024','04/11/2024');
INSERT INTO TB_Alquiler VALUES (106, 1006, '27/10/2024','29/10/2024');
INSERT INTO TB_Alquiler VALUES (105, 1006, '06/11/2024','10/11/2024');
INSERT INTO TB_Alquiler VALUES (104, 1005, '30/10/2024','01/11/2024');
INSERT INTO TB_Alquiler VALUES (104, 1004, '16/12/2024','19/12/2024');
INSERT INTO TB_Alquiler VALUES (104, 1003, '21/12/2024','23/12/2024');
INSERT INTO TB_Alquiler VALUES (103, 1003, '12/12/2024','15/12/2024');
INSERT INTO TB_Alquiler VALUES (102, 1002, '01/01/2025','03/01/2025');
INSERT INTO TB_Alquiler VALUES (101, 1001, '15/01/2025','18/01/2025');

GO
-- Listar los valores registrados por cada tablas
SELECT * FROM TB_Marca;
SELECT * FROM TB_Automovil;
SELECT * FROM TB_Cliente;
SELECT * FROM TB_Alquiler;

GO
SELECT * FROM TB_Automovil WHERE cod_auto>=102 AND cod_auto>=106;
SELECT * FROM TB_Automovil WHERE cod_auto BETWEEN 102 AND 106;
SELECT * FROM TB_Automovil WHERE color_auto='AZUL' OR color_auto='ROJO';
SELECT * FROM TB_Automovil WHERE color_auto IN ('AZUL','ROJO');
SELECT cod_auto, modelo_auto, color_auto, cod_marca FROM TB_Automovil  WHERE cod_marca=1 OR cod_marca=4;
SELECT cod_auto, modelo_auto, color_auto, cod_marca FROM TB_Automovil  WHERE cod_marca IN (1,4);
SELECT * FROM TB_Cliente WHERE cod_cli<1006 AND NOT tipo_cli='POTENCIAL';
SELECT DISTINCT color_auto FROM TB_Automovil;
SELECT * FROM TB_Cliente ORDER BY ape_pat_cli DESC;
SELECT * FROM TB_Cliente ORDER BY tipo_cli DESC, nom_cli ASC;
SELECT * FROM TB_Automovil ORDER BY precio_auto DESC;
SELECT TOP 3 * FROM TB_Automovil ORDER BY precio_auto ASC;
SELECT * FROM TB_Automovil WHERE modelo_auto IN ('TUCSON','SPORTAGE','SENTRA');
SELECT * FROM TB_Automovil WHERE precio_auto BETWEEN 20000 AND 23000;
SELECT * FROM TB_Cliente WHERE nom_cli LIKE 'A%';
SELECT * FROM TB_Cliente WHERE nom_cli LIKE 'A%' OR nom_cli LIKE 'C%';
SELECT * FROM TB_Cliente WHERE nom_cli LIKE 'A%' OR nom_cli LIKE 'C%' ORDER BY nom_cli ASC;
SELECT *,CASE WHEN tipo_cli='POTENCIAL' THEN 2800 WHEN tipo_cli='REGULAR' THEN 2500 ELSE 2000 END AS Beneficio FROM TB_Cliente;
SELECT *,CASE WHEN tipo_cli='POTENCIAL' THEN 2800 WHEN tipo_cli='REGULAR' THEN 2500 ELSE 2000 END AS Beneficio FROM TB_Cliente ORDER BY Beneficio ASC;
SELECT *,CASE WHEN cod_marca=1 THEN 'KIA' WHEN cod_marca=2 THEN 'Hyundai'
			  WHEN cod_marca=3 THEN 'Toyota'  WHEN cod_marca=4 THEN 'Nissan' 
			  WHEN cod_marca=5 THEN 'Ford'  WHEN cod_marca=6 THEN 'Wolkswagen'
			  WHEN cod_marca=7 THEN 'Peugeot' END AS Beneficio FROM TB_Automovil;
CREATE VIEW  VistaClientes AS SELECT * FROM TB_Cliente WHERE tipo_cli='Potencial' AND ape_pat_cli LIKE 'C%O';
SELECT * FROM VistaClientes;
CREATE VIEW AutosMarcaModelo AS SELECT *,CASE WHEN cod_marca=1 THEN 'KIA' WHEN cod_marca=2 THEN 'Hyundai'
			  WHEN cod_marca=3 THEN 'Toyota'  WHEN cod_marca=4 THEN 'Nissan' 
			  WHEN cod_marca=5 THEN 'Ford'  WHEN cod_marca=6 THEN 'Wolkswagen'
			  WHEN cod_marca=7 THEN 'Peugeot' END AS Beneficio FROM TB_Automovil;
SELECT * FROM AutosMarcaModelo;









