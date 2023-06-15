/*
Script de DCL
*/

/*
Cosas que realizar antes de
*/
use proyecto_db_guarderia
go

/*
Reportes:
A partir del registro de esta información, interesa poder obtener estadísticas de:
1. El tipo de mascota que más se deja en la guardería para su cuidado (tipo y
cantidad).
*/
SELECT especie AS TipoMascota, COUNT(*) AS Cantidad
FROM MASCOTA
GROUP BY especie
ORDER BY Cantidad DESC
/*
2. En qué época del año se deja un mayor número de mascotas en la guardería
*/
SELECT DATEPART(MONTH, FechaIngreso) AS Mes, COUNT(*) AS CantidadMascotas
FROM BRAZALETE
GROUP BY DATEPART(MONTH, FechaIngreso)
ORDER BY CantidadMascotas DESC;

/*
3. Listado de las mascotas y su dueño datos generales, número de días en la
guardería, datos generales de ambos. EL reporte se obtiene en un periodo de
fechas
*/
SELECT M.Nombre AS Mascota, M.especie, M.Raza, M.Edad, D.*, 
       DATEDIFF(DAY, B.FechaIngreso, B.FechaSalida) AS DiasEnGuarderia
FROM MASCOTA AS M
left JOIN USUARIO AS D ON M.idCliente = D.idCliente
left JOIN BRAZALETE AS B ON M.id_brazalete = B.id_brazalete
ORDER BY B.FechaIngreso;

/*4. Enfermedades más frecuentes (5), total de animales con dicha enfermedad
ordenados de mayor a menor
*/

create or alter view Enfermedades_frecuentes 
as 
SELECT top 5 C.Diagnostico AS Enfermedad, COUNT(*) AS TotalAnimales
FROM CONSULTA AS C
GROUP BY C.Diagnostico
ORDER BY TotalAnimales DESC

select * from Enfermedades_frecuentes

/*
Reportes
A partir del registro de esta información, interesa poder obtener estadísticas de:
	1. Gastos de cada mascota, datos de la mascota, fechas y días de estancia,
	descripción de gatos y costo.
*/
select m.*, fechaingreso, detalles, diagnostico,nombreMedicamento,costo  from MASCOTA AS m
left join BRAZALETE as b on m.id_brazalete = b.id_brazalete
left join VETERINARIO as v on m.idVeterinario = v.idEmpleado
left join CONSULTA as c on v.idEmpleado = c.idEmpleado
left join RECIBO_VET as rv on c.id_consulta = rv.id_consulta
left join TRATAMIENTO as t on c.id_consulta = t.id_consulta
left join Medicamento as med on t.idMedicamento = med.idMedicamento
go
/*
	2. Listado con datos generales de las consultas por periodos de tiempo,
	incluyendo veterinario que lo atendió, diagnóstico y medicamento.
*/
create or alter view Consultas_general
as
select c.*, e.aPaterno+' '+isnull(e.aMaterno,'-')+' '+e.nombre as 'veterinario que atendio', nombreMedicamento, costo from CONSULTA as c
left join VETERINARIO as v on c.idEmpleado = v.idEmpleado
left join EMPLEADO as e on v.idEmpleado = e.idEmpleado
left join TRATAMIENTO as t on t.id_consulta = c.id_consulta
left join Medicamento as m on t.idMedicamento = m.idMedicamento

select * from Consultas_general

/*
3. Inventario de medicamentos, con su costo por centro.
*/
select nombreMedicamento as Medicamento, costo, g.idguarderia from Medicamento as m
left join TRATAMIENTO as t on m.idMedicamento = t.idMedicamento
left join CONSULTA as c on t.id_consulta = c.id_consulta
left join VETERINARIO as v on c.idEmpleado = v.idEmpleado
left join EMPLEADO as e on v.idEmpleado = e.idEmpleado
left join GUARDERIA as g  on e.idguarderia = g.idguarderia
where g.idguarderia is not null
/*
4. Enfermedades más frecuentes, por centro, ordenadas de mayor a menor
*/

SELECT top 5 g.idguarderia, C.Diagnostico AS Enfermedad, COUNT(*) AS TotalAnimales FROM CONSULTA AS C
left join VETERINARIO as v on c.idEmpleado = v.idEmpleado
left join EMPLEADO as e on v.idEmpleado = e.idEmpleado
left join GUARDERIA as g  on e.idguarderia = g.idguarderia
where g.idguarderia is not null
GROUP BY g.idguarderia, C.Diagnostico
ORDER BY TotalAnimales DESC

/*
5. Reporte de ventas e medicamentos en un periodo de tiempo, incluyendo
cantidad y monto total
*/

select nombreMedicamento as Medicamento, costo, fecha, c.fechaHora from Medicamento as m
left join TRATAMIENTO as t on m.idMedicamento = t.idMedicamento
left join CONSULTA as c on t.id_consulta = c.id_consulta
left join VETERINARIO as v on c.idEmpleado = v.idEmpleado
left join RECIBO_VET as rv on c.id_consulta = rv.id_consulta
where fecha is not null
order by fecha


/*

Reportes
A partir del registro de esta información, interesa poder obtener la siguiente
información:
1. El centro con mayor número de ventas en un periodo de tiempo. (Separar las
ventas en línea de las ventas físicas de cada estado).
*/

select * FROM GUARDERIA

	select distinct g.idguarderia,C.idCompra, count(c.idCompra) as Total_ventas, tipo, fechaCompra from GUARDERIA as g 
	LEFT join EMPLEADO as e on g.idguarderia = e.idguarderia
	LEFT join FISICA as f on e.idEmpleado = f.idEmpleado
	LEFT join COMPRA as c on f.idCompra = c.idCompra
	where c.idCompra is not null
	group by C.idCompra,g.idguarderia,tipo, fechaCompra

 
/*
2. Los artículos más vendidos y los menos vendidos por categoría.
*/
select p.idProducto, precio,descripcion, cantidad from PRODUCTO as p 
left join COMPRA_PRODUCTO as cp on p.idProducto = cp.idProducto
where cantidad is not null 
order by descripcion,cantidad DESC

/*
3. Época en la que más se vende. Época del año y monto total
*/
select * from COMPRA

SELECT top 1 DATEPART(MONTH, fechaCompra) as mes, SUM(total) AS monto_total_vendido
FROM COMPRA
group by DATEPART(MONTH, fechaCompra)
ORDER BY monto_total_vendido DESC

go

/*
4. Los 5 empleados con mayor comisión, este reporte se obtiene de manera
mensual
*/

create or alter view Empleados_MayorComision
as
SELECT top 5 e.idEmpleado, e.nombre, SUM(comision) AS total_comision FROM EMPLEADO as e 
left join FISICA as f on e.idEmpleado = f.idEmpleado
left join COMPRA as c on f.idCompra = c.idCompra
GROUP BY e.idEmpleado, e.nombre
ORDER BY total_comision DESC
go
	
select * from Empleados_MayorComision

/*
5. Inventario de los productos de cada tienda
*/
select idProducto, precio, descripcion, p.idguarderia from PRODUCTO as p 
left join GUARDERIA as g on p.idguarderia = g.idguarderia
order by p.idguarderia
