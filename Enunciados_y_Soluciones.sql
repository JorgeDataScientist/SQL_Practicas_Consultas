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

