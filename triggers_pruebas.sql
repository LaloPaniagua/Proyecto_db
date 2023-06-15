select * from COMPRA
select * from COMPRA_PRODUCTO
select * from PRODUCTO
select * from FISICA
select * from LINEA

insert into TRATAMIENTO values(6,4,'1 cada 8 horas',1,2)
select * from TRATAMIENTO

begin tran
update Medicamento
set stock=9
update RECIBO_VET
set folioRecibo=734 where id_consulta=3
select * from RECIBO_VET
rollback tran
select * from RECIBO_VET

begin tran
update COMPRA_PRODUCTO
set cantidad=3 where idCompra=1 and idProducto=1
select * from COMPRA_PRODUCTO
rollback tran
select * from COMPRA_PRODUCTO

begin tran
update COMPRA
set tipo='F' where idCompra=1
select * from COMPRA
rollback tran
select * from COMPRA



begin tran
update FISICA
set idEmpleado=11 where idCompra=1
select * from VENDEDOR
rollback tran
select * from VENDEDOR

--Constraint + función para cancelar compra
--No funciona :C
begin tran
update COMPRA
set status='C' where idCompra=3
select * from COMPRA
rollback tran
select * from COMPRA