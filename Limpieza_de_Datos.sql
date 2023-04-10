use empleadoss_departamentoss;

/* Cambiando Nombres de Columnas de la tabla expleados */
ALTER TABLE empleados CHANGE CarnetIdentidad CIdentidad float NOT NULL;

ALTER TABLE empleados CHANGE nombre Nombre varchar(30) COLLATE utf8_bin NOT NULL;

ALTER TABLE empleados CHANGE sexEmp Genero char(1) COLLATE utf8_bin NOT NULL;

ALTER TABLE empleados CHANGE fecNac Fecha_Nacimiento date NOT NULL;

ALTER TABLE empleados CHANGE fecIncorporacion Fecha_Inicio_Laboral date NOT NULL;

ALTER TABLE empleados CHANGE salEmp Salario float NOT NULL;

ALTER TABLE empleados CHANGE comisionE Comisiones float NOT NULL;

ALTER TABLE empleados CHANGE cargoE Cargo varchar(15) COLLATE utf8_bin NOT NULL;

ALTER TABLE empleados CHANGE jefeID IdJefe varchar(12) COLLATE utf8_bin DEFAULT NULL;


select * 
from empleados;
