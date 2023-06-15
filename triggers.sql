

use proyecto_db_guarderia
go




/*
Paniagua Broca Eduardo Miguel
Rivero Morales Andrea Estefania
Salgado Becerra Jhusteene Ezequiel

*/


create or alter trigger tr_tratamiento
on tratamiento
after insert,update
as
declare @idCon as numeric(10),
		@idTra as numeric(10),
		@cant as smallint,
		@dosismed as varchar(30),
		@idMedicina as numeric(10)
begin
	select @idCon=id_consulta from inserted
	select @idTra=id_tratamiento from inserted
	select @cant=cantidad from inserted
	select @dosismed=dosis from inserted
	select @idMedicina=idMedicamento from inserted
	delete from TRATAMIENTO where id_tratamiento=@idTra
	exec ventaMedicamento @idTratamiento=@idTra,@cantidad=@cant,@dosis=@dosismed,@idMedicamento=@idMedicina,@idConsulta=@idCon
end

go


create or alter trigger tr_recibovet
on recibo_vet
after insert,update
as
	begin
	declare @folio as numeric(10),
			@fecha as datetime,
			@id_consulta as numeric(10),
			@total as money
	
	
	
	select @folio=folioRecibo from inserted
	select @folio
	select @fecha=fecha from inserted
	select @fecha
	select @id_consulta=id_consulta from inserted
	select @id_consulta

	select @total = sum(T.cantidad*M.costo) from Medicamento M inner join TRATAMIENTO T on T.idMedicamento=M.idMedicamento where @id_consulta=T.id_consulta
	select @total= @total+ 150
	if (@total is null)
	begin
		select @total=150
	end
	update RECIBO_VET
	set folioRecibo=@folio,
		fecha=@fecha,
		id_consulta=@id_consulta,
		totalConsulta=@total
	where folioRecibo=@folio
	end
	go




create or alter trigger tr_compraproducto
on COMPRA_PRODUCTO
instead of insert,update
as
	begin
	declare @idCompra as numeric(10)
	declare @idProducto as numeric(10)
	declare @cantidad as int
	declare @subtotal as money

	select @idCompra=idCompra from inserted
	select @idProducto=idProducto from inserted
	select @cantidad = cantidad from inserted
	select @subtotal = @cantidad * (select precio from PRODUCTO where idProducto = @idProducto)

	delete from COMPRA_PRODUCTO where idCompra=@idCompra and idProducto=@idProducto
	insert into COMPRA_PRODUCTO values (@idCompra,@idProducto,@cantidad,@subtotal)
	end

go


create or alter trigger tr_compra
on COMPRA
after insert,update
as
	begin
	declare @idCompra as numeric
	declare @fecha as date
	declare @tipo as char
	declare @total as money
	declare @idCliente as numeric
	declare @status char(2)

	select @idCompra = idCompra from inserted
	select @fecha = fechaCompra from inserted
	select @tipo = tipo from inserted
	select @idCliente = idCliente from inserted
	select @status = status from inserted
	select @total = (select sum (subtotal) from COMPRA_PRODUCTO where idCompra=@idCompra)
	update COMPRA
		set idCompra=@idCompra,
			fechaCompra=@fecha,
			tipo=@tipo,
			total=@total,
			idCliente=@idCliente,
			status=@status
		where idCompra=@idCompra
	end


create or alter trigger tr_cancelacion
on COMPRA
after insert,update
as
begin
	declare @idCompraa as numeric
	declare @status char(2)
	select @idCompraa=idCompra from inserted
	select @status= status from inserted

	if(@status='C')
	begin
		exec cancelaVenta @idCompra=@idCompraa
	end
end



create or alter trigger tr_comision
on FISICA
after insert,update
as
begin
	declare @idVenta numeric (10)
	declare @total money
	declare @idVendedor numeric(10)
	select @idVenta=idCompra from inserted
	select @total = total from COMPRA where idCompra=@idVenta
	select @idVendedor=idEmpleado from inserted
	update FISICA
	set comision = 0.15 * @total
	where idCompra=@idVenta
	update VENDEDOR
	set pago=pago + (select comision from FISICA where idCompra=@idVenta)
	where idEmpleado=@idVendedor
end