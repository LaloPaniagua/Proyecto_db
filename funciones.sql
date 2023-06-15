


/*
Paniagua Broca Eduardo Miguel
Rivero Morales Andrea Estefania
Salgado Becerra Jhusteene Ezequiel

*/

use proyecto_db_guarderia
go

--Realice un procedimiento almacenado para registrar una mascota y su brazalete
create or alter procedure registraMascota
@idMascota numeric(9),
@sexo char(1),
@nombre varchar(10),
@especie char(1),
@edad tinyint,
@rasgos varchar (30),
@raza varchar(20),
@idBrazalete numeric (9),
@idDueño numeric (9),
@idVet numeric(9),
@idCuidador numeric (9)
as
insert into MASCOTA values(@idMascota,@sexo,@nombre,@especie,@edad,@rasgos,@raza,@idBrazalete,@idDueño,@idVet,@idCuidador)
go

create or alter procedure registraBrazalete
@statusComida varchar (25),
@statusMedicamento varchar (25),
@cuidados varchar (25)
as
insert into BRAZALETE (EstatusComida,EstatusMedicamento,CuidadosEspeciales) values(@statusComida,@statusMedicamento,@cuidados)
go


create or alter procedure nuevaMascota
@idMascota numeric(10),
@sexo char(1),
@nombre varchar(10),
@especie char(1),
@edad tinyint,
@rasgos varchar (30),
@raza varchar(20),
@idDueño numeric (10),
@idVet numeric(10),
@idCuidador numeric (10),
@statusComida varchar (25),
@statusMedicamento varchar (25),
@cuidados varchar (25)
as
insert into BRAZALETE (EstatusComida,EstatusMedicamento,CuidadosEspeciales) values(@statusComida,@statusMedicamento,@cuidados)
declare @idBrazalete int
select @idBrazalete=max(id_brazalete) from BRAZALETE
insert into MASCOTA values(@idMascota,@sexo,@nombre,@especie,@edad,@rasgos,@raza,@idBrazalete,@idDueño,@idVet,@idCuidador)
go


--Realice un procedimiento almacenado para el actualizar de las lecturas en los brazaletes
create or alter procedure nuevaMedicion
@idMedicion numeric(9),
@ritmoC numeric(5),
@nivelOx numeric(5),
@temp numeric(5),
@idBrazalete int
as
declare @fechaHora datetime
select @fechaHora = getdate()
insert into MEDICION values (@idMedicion,@ritmoC,@fechaHora,@nivelOx,@temp,@idBrazalete)
go

--Realice un procediendo almacenado para registrar una consulta
create or alter procedure nuevaConsulta
@idCon numeric(9),
@detalles varchar(35),
@diagnostico varchar (25),
@idVet numeric(9)

as
declare @fechaHora datetime
select @fechaHora=getdate()
insert into CONSULTA values (@idCon,@detalles,@fechaHora,@diagnostico,@idVet)

go




--Realice un procedimiento almacenado para el registro y venta de medicamentos
--incluyendo la actualización del stock
create or alter procedure registraMedicamento
@idMedicamento numeric(9),
@costo money,
@nombreMedicamento varchar(30),
@stock int
as
insert into Medicamento values(@idMedicamento,@costo,@nombreMedicamento,@stock)
go

create or alter procedure ventaMedicamento
@idTratamiento numeric(10),
@cantidad int,
@dosis varchar(30),
@idMedicamento numeric (10),
@idConsulta numeric(10)
as
begin
	insert into TRATAMIENTO values (@idTratamiento,@cantidad,@dosis,@idMedicamento,@idConsulta)
	if(@cantidad<=(select stock from Medicamento where idMedicamento=@idMedicamento))
	begin
		update Medicamento
		set stock = stock - @cantidad
		where idMedicamento=@idMedicamento
		update RECIBO_VET
		set totalConsulta=totalConsulta + (@cantidad*(select costo from Medicamento where idMedicamento=@idMedicamento))
		where id_consulta=@idConsulta
	end
	else
	begin
		select 'No hay suficiente stock' as mensaje
		delete from TRATAMIENTO where id_tratamiento=@idTratamiento
	end
end
go


--Realice un procedimiento almacenado para borrar un usuario, recibe como
--parámetros el nombre de usuario.
create or alter procedure borrarUsuario
@nomUsuario varchar (20)
as
begin
	delete from USUARIO
	where nomUsuario=@nomUsuario
end
GO





create or alter procedure agregarProductosVenta
@idCompra numeric(10),
@producto varchar(25),
@cantidad int
as
begin
	declare @idProducto numeric(10)
	select @idProducto=idProducto from PRODUCTO where descripcion=@producto
	insert into COMPRA_PRODUCTO values(@idCompra,@idProducto,@cantidad,0)
end
go


--Realice un procedimiento para dar de alta una venta, y otro para cancelar una
--venta en línea, así como cancelar una venta física.
create or alter procedure nuevaVenta
@idVenta numeric (10),
@fecha date,
@tipo char(1),
@idCliente numeric(10),
@estatus char(1),
@cantidad int
as
begin
	insert into COMPRA values (@idVenta,@fecha,@tipo,0,@idCliente,@estatus)
end
go

create or alter procedure cancelaVenta
@idCompra numeric(10)
as
begin
	update COMPRA
	set status='C'
	where idCompra=@idCompra
	if (select tipo from COMPRA where idCompra=@idCompra)='F'
	begin
		declare @idEmpleado numeric(10)
		if exists(select * from FISICA where idCompra=@idCompra)
		begin
			select @idEmpleado=idEmpleado from FISICA where idCompra=@idCompra
			update VENDEDOR
			set pago=pago - ((select total from COMPRA where idCompra=@idCompra ) * 0.15)
			where idEmpleado=(select idEmpleado from FISICA where idCompra=@idCompra)
		end
		else
		begin
			declare @idComp numeric (10)
			select @idComp = @idCompra
			update COMPRA
			set tipo='L'
			where idCompra = @idCompra
			exec cancelaVenta @idCompra=@idComp
		end
	end
	else
	begin
		if exists (select * from LINEA where idCompra=@idCompra)
		begin
			update LINEA
			set cancelacion = 0.2 * (select total from COMPRA where idCompra = @idCompra)
			where idCompra=@idCompra
		end
		else
		begin
			declare @idComp02 numeric (10)
			select @idComp02 = @idCompra
			update COMPRA
			set tipo='F'
			where idCompra = @idCompra
			exec cancelaVenta @idCompra=@idComp02
		end
	end
end