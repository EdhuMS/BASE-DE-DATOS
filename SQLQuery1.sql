-- Creamos la base de datos
CREATE DATABASE DB_Alquiler;
-- Activamos la base de datos
USE DB_Alquiler;
-- Mostrar la base de datos
SELECT DB_NAME();
-- Creamos las 4 tablas
CREATE TABLE TB_Automovil(
cod_auto int not null,
modelo_auto varchar(25),
fec_auto date,
color_auto varchar(15),
precio_auto decimal(7,2),
cod_marca int
);
CREATE TABLE TB_Marca(
cod_marca int not null,
nom_marca varchar(20),
fec_ing date,
pais_proc varchar(20)
);
CREATE TABLE TB_Cliente(
cod_cli int not null,
nom_cli varchar(20),
ape_pat_cli varchar(20),
ape_mat_cli varchar(20),
fec_nac_cli date,
tipo_cli varchar(20)
);
CREATE TABLE TB_Alquiler(
cod_auto int not null,
cod_cli int not null,
fec_ini_asig date,
fec_fin_asig date
);
-- Asignamos las llaves primarias
ALTER TABLE TB_Marca ADD PRIMARY KEY(cod_marca);
ALTER TABLE TB_Automovil ADD PRIMARY KEY(cod_auto);
ALTER TABLE TB_Cliente ADD PRIMARY KEY(cod_cli);
ALTER TABLE TB_Alquiler ADD PRIMARY KEY(cod_auto, cod_cli);
-- Asignamos las llaves foraneas
ALTER TABLE TB_Automovil  ADD FOREIGN KEY(cod_marca) REFERENCES TB_Marca;
ALTER TABLE TB_Alquiler  ADD FOREIGN KEY(cod_cli) REFERENCES TB_Cliente;
ALTER TABLE TB_Alquiler  ADD FOREIGN KEY(cod_auto) REFERENCES TB_Automovil;

ALTER TABLE TB_Cliente ADD direccion varchar(65);
ALTER TABLE TB_Cliente ADD correo varchar(40);
ALTER TABLE TB_Cliente DROP COLUMN fec_nac_cli;
