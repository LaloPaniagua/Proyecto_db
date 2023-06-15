/*

Paniagua Broca Eduardo Miguel
Rivero Morales Andrea Estefania
Salgado Becerra Jhusteene Ezequiel


*/
use[proyecto_db_guarderia]

create login usuario_prueba
with password = '123456'
create user usuario_prueba
for login usuario_prueba

create login cuidador_prueba
with password = '123456'
create user cuidador_prueba
for login cuidador_prueba

create login cuidador_jefe_prueba
with password = '123456'
create user cuidador_jefe_prueba
for login cuidador_jefe_prueba

create login veterinario_prueba
with password = '123456'
create user veterinario_prueba
for login veterinario_prueba

create login administrativo_prueba
with password = '123456'
create user administrativo_prueba
for login administrativo_prueba

create login encargadoTienda_prueba
with password = '123456'
create user encargadoTienda_prueba
for login encargadoTienda_prueba

create login gerente_prueba
with password = '123456'
create user gerente_prueba
for login gerente_prueba



create role usuario
authorization usuario_prueba
grant insert on object:: dbo.USUARIO to usuario
grant select on object:: dbo.PRODUCTO to usuario
grant insert on object:: dbo.MASCOTA to usuario
grant select on object:: dbo.BRAZALETE to usuario
grant select on object:: dbo.RECIBO_VET to usuario
grant select on object :: dbo.FISICA to usuario
grant select on object:: dbo.LINEA to usuario
grant select on object:: dbo.CONSULTA to usuario
grant select on object:: dbo.OFERTA to usuario
grant select on object:: dbo.COMPRA_PRODUCTO to usuario



create role cuidador
authorization cuidador_prueba
grant select on object:: dbo.MASCOTA to cuidador
grant select, update, insert, delete on object::dbo.BRAZALETE to cuidador
grant select, update, insert, delete on object::dbo.MEDICION to cuidador


create role cuidador_jefe
authorization cuidador_jefe_prueba
grant select, delete  on object:: dbo.MASCOTA to cuidador_jefe
grant select, delete  on object:: dbo.CUIDADOR to cuidador_jefe
grant select, update, insert, delete on object::dbo.BRAZALETE to cuidador_jefe
grant select, update, insert, delete on object::dbo.MEDICION to cuidador_jefe



create role veterinario
authorization veterinario_prueba
grant select,update,delete, insert on object:: dbo.RECIBO_VET to veterinario
grant select,update,delete, insert on object:: dbo.TRATAMIENTO to veterinario
grant select,update,delete, insert on object:: dbo.CONSULTA to veterinario
grant select on object::dbo.Medicamento to veterinario


create role administrativo
authorization administrativo_prueba
grant select,update,delete, insert on object:: dbo.USUARIO to administrativo
grant select,update,delete, insert on object:: dbo.OFERTA to administrativo
grant select,update,delete, insert on object:: dbo.PRODUCTO to administrativo


create role encargadoTienda
authorization encargadoTienda_prueba
grant select,update,delete, insert on object:: dbo.PRODUCTO to encargadoTienda
grant select,update,delete, insert on object:: dbo.COMPRA to encargadoTienda
grant select,update,delete, insert on object:: dbo.LINEA to encargadoTienda
grant select,update,delete, insert on object:: dbo.FISICA to encargadoTienda

create role gerente
authorization gerente_prueba
grant select,update,delete, insert on object:: dbo.EMPLEADO to gerente
grant select,update,delete, insert on object:: dbo.VETERINARIO to gerente
grant select,update,delete, insert on object:: dbo.VENDEDOR to gerente
grant select,update,delete, insert on object:: dbo.ADMINISTRATIVO to gerente
grant select,update,delete, insert on object:: dbo.CUIDADOR to gerente