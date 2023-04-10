use empleadoss_departamentoss;

/* 1. Obtener los datos completos de los empleados. */
select * 
from empleados;

/* 2. Obtener los datos completos de los departamentos */
select * 
from departamentos;

/* 3. Obtener los datos de los empleados con cargo 'Secretaria'. */
select * 
from empleados 
where Cargo='Secretaria';

/* 4. Obtener el nombre y salario de los empleados. */
select Nombre, Salario 
from empleados;

/* 5. Obtener los datos de los empleados vendedores, ordenado por nombre. */
select * 
from empleados 
where lower(Cargo)='vendedor' 
order by Nombre asc;

/* 6. Listar el nombre de los departamentos */
select distinct nombreDPto 
from departamentos;

/* 7. Obtener el nombre y cargo de todos los empleados, ordenado por salario */
select nombre, cargo, salario 
from empleados 
order by salario desc;

/* 8. Listar, de los empleados del departamento 2000 y ordenado por comisión, los siguientes:
    - codigo de departamento
    - nombre
    - cargo
    - salario
    - comisiones
*/
SELECT codDepto, nombre, cargo, salario, comisiones 
FROM empleados 
WHERE codDepto=2000 
ORDER BY comisiones;
/* 8.1. ver los empleados que pertenecen al codigo por departamento 2000 */
SELECT *
FROM empleados
WHERE codDepto = 2000;
/* 8.2. ver la cantidad total de empleados que pertenecen al codigo por departamento 2000 */
SELECT COUNT(*) as total_Empleados
FROM empleados
WHERE codDepto = 2000;

/* 9. Listar los montos de todas las comisiones, sin repeticiones */
select distinct comisiones 
from empleados;
/* 9.1. Sumatoria de todas las comisiones a pagar*/
select sum(comisiones) as Sumatoria_Comisiones
from empleados;
/* 9.2. Listar todos los empleados que han ganado comisiones */
select nombre, comisiones 
from empleados
order by nombre;
/* 9.3. Cantidad de empleados que han ganado comisiones */
SELECT COUNT(*) as total_comisiones
FROM empleados
WHERE comisiones >= 1;
/* 9.4. Cantidad de empleados que NO han ganado comisiones */
SELECT COUNT(*) as total_comisiones
FROM empleados
WHERE comisiones <= 1;
/* 9.5. quien es y que cargo tiene el empleado que NO gano comisiones? */
SELECT nombre, cargo, comisiones as Monto_de_Comisiones
FROM empleados
WHERE comisiones <= 1;
/* 9.6. quien es y que cargo tiene el empleado que gano Mas comisiones? */
SELECT nombre, cargo, comisiones as Monto_de_Comisiones
FROM empleados
WHERE comisiones = (SELECT MAX(comisiones) FROM empleados);
/* ------------------------------------  */
/* 10. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una bonificación de 500.000, en orden alfabético del empleado */
select nombre, Salario, (Salario + 500000) as pago_estimado
from empleados 
where codDepto = 3000
order by nombre;

/* 11. Obtener la lista de los empleados que ganan una comisión superior a su sueldo. */
select nombre, salario, comisiones
from empleados
where comisiones > salario
order by salario;

/* 12. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo. */
select nombre, salario, comisiones
from empleados
where comisiones <= (salario*0.3);

/* 13.Elabore un listado donde para cada fila, figure 'Nombre' y 'Cargo' antes del valor respectivo para cada empleado. */
select 	nombre as Nombre, cargo as Cargo
from empleados;

/* 14. Hallar el salario y la comisión de aquellos empleados cuyo número de documento de identidad es
superior al '19.709.802' */
select 	CarnetIdentidad, salario, comisiones
from empleados 
where CarnetIdentidad > '19.709.802';

/* 15. Muestra los empleados cuyo nombre empiece entre las letras J y Z (rango). Liste estos empleados y su cargo por orden alfabético. */
select 	nombre, cargo 
from empleados 
where lower(nombre) > 'j' and lower(nombre) < 'z' 
order by nombre;

/* 16. Listar el salario, la comisión, el salario total (salario + comisión), documento de identidad del empleado y nombre, de aquellos empleados que tienen comisión superior a 1.000.000, ordenar el informe por el número del documento de identidad. */
select 	salario, comisiones, (salario + Comisiones) as Salario_total, CarnetIdentidad, nombre
from empleados 
where Comisiones > 1000000 
order by CarnetIdentidad;

/* 17. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión */
select 	salario, comisiones, (salario + comisiones) as Salario_total, CarnetIdentidad, nombre 
from empleados 
where comisiones = 0 
order by CarnetIdentidad;

/* 18. Hallar los empleados cuyo nombre no contiene la cadena "MA" */
select nombre 
from empleados 
where lower(nombre) not like '%ma%';

/* 19. Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” NI 'MANTENIMIENTO' */
select nombreDpto 
from departamentos 
where lower(nombreDpto) not in ('ventas', 'investigación', 'mantenimiento');
/* ------------------------------------------ */
/* 20. Obtener el nombre y el departamento de los empleados con cargo 'Secretaria' o 'Vendedor', que no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1.000.000, ordenados por fecha de incorporación. */
select e.nombre, d.nombreDpto
from empleados e, departamentos d
where e.codDepto=d.codDepto and lower(e.cargo)='secretaria' and lower(e.cargo)='vendedor' and lower(d.nombreDpto) = 'produccción' and e.salario > 1000000
order by e.Fecha_Inicio_Laboral;

/* 21. Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres */

select * 
from empleados
where char_length(nombre) = 11;

/* 22. Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres */
select * 
from empleados
where char_length(nombre) < 11;

/* 23. Listar los datos de los empleados cuyo nombre inicia por la letra 'M', su salario es mayor a $800.000 o reciben comisión y trabajan para el departamento de 'VENTAS' */
select e.nombre, d.nombreDpto, e.salario
from empleados e, departamentos d
where e.codDepto=d.codDepto and lower(e.nombre) like 'm%' and (e.salario > 800000  or e.comisiones>0) and lower(d.nombreDpto)<>'ventas';

/* 24. Obtener los nombres, salarios y comisiones de los empleados que reciben un salario situado entre la mitad de la comisión la propia comisión */
select nombre, salario, comisiones
from empleados
where salario between (comisiones/2) and comisiones;