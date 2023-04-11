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

/* 25. Mostrar el salario más alto de la empresa. */
select 	nombre, max(Salario) as Salario_mayor from empleadoss_departamentoss.empleados;

/* ------------------------------------------ */ 
use empleadoss_departamentoss;

select * 
from empleadoss_departamentoss.empleados;

select * 
from empleadoss_departamentoss.departamentos;
/* ------------------------------------------ */

/* 26. Mostrar cada una de las comisiones y el número de empleados que las reciben. Solo si tiene comision. */
select 	comisiones, count(*) as Num_empleados 
from empleadoss_departamentoss.empleados 
group by comisiones 
having comisiones > 0;

/* 27. Mostrar el nombre del último empleado de la lista por orden alfabético, su salario y cargo. */
select max(nombre) as Mayor_alfabeticamente, salario, cargo  
from empleadoss_departamentoss.empleados;

/* 28. Hallar el salario más alto, el más bajo y la diferencia entre ellos. */
select 	max(salario) as Salario_mayor, min(salario) as Salario_menor, max(salario) - min(salario) as 'Diferencia_de_Salario' 
from empleadoss_departamentoss.empleados;

/* 29. Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento. */
select  codDepto, genero, count(*) 
from empleadoss_departamentoss.empleados 
group by codDepto, genero;
/* 29.1. El mismo que el anterior pero aca agregare el nombre del departamento */
SELECT d.nombreDpto, e.genero, COUNT(*) AS num_empleados
FROM empleadoss_departamentoss.empleados e
JOIN empleadoss_departamentoss.departamentos d
ON e.codDepto = d.codDepto
GROUP BY d.codDepto, e.genero;


/* 30. Hallar el salario promedio por departamento. */
select  codDepto, avg(salario) 
from empleadoss_departamentoss.empleados  
group by codDepto;
/* 30.1. redondear la respuesta anterior a dos decimales*/ 
SELECT codDepto, ROUND(AVG(salario), 2) AS promedio_salarios
FROM empleadoss_departamentoss.empleados
GROUP BY codDepto;

/* ------------------------------------------ */
/* 31. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento. */
select CarnetIdentidad, nombre, salario 
from empleadoss_departamentoss.empleados
where salario >= (select avg(salario) from empleadoss_departamentoss.empleados)
order by codDepto asc;

32. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.

select d.codDepto, d.nombreDpto, count(*) as 'Num empleados' 
from departamentos d, empleados e 
where d.codDepto=e.codDepto 
group by d.codDepto 
having count(*) >= 3;


33. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los que tengan mas de dos empleados y ordenados de mayor a menor.

select j.nDIEmp, j.nomEmp, count(*) as 'Num Empleados' 
from empleados e, empleados j 
where e.jefeID=j.nDIEmp 
group by j.nomEmp 
having count(*)>=2 
order by count(*) desc;


34. Hallar los departamentos que no tienen empleados

select d.codDepto, d.nombreDpto 
from departamentos d, empleados e 
where d.codDepto=e.codDepto 
group by d.codDepto 
having count(*) = 0;

35. Mostrar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de la
suma.

select d.nombreDpto, sum(e.salEmp) 
from departamentos d, empleados e 
where d.codDepto=e.codDepto 
group by d.nombreDpto 
order by  sum(e.salEmp) desc 
limit 1;
/* ------------------------------------------ */
