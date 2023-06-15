
/*
Paniagua Broca Eduardo Miguel
Rivero Morales Andrea Estefania
Salgado Becerra Jhusteene Ezequiel
*/

 create database proyecto_db_guarderia
 go

 use [proyecto_db_guarderia]


CREATE TABLE ADMINISTRATIVO(
    idEmpleado         numeric(10, 0)    NOT NULL,
    genero             char(1)           NOT NULL,
    telefono           numeric(10, 0)    NOT NULL,
    correo             varchar(30)       NOT NULL,
    NoTarjeta          numeric(19, 0)    NOT NULL,
    VigenciaTarjeta    varchar(5)        NOT NULL,
    CONSTRAINT idAdministrativo PRIMARY KEY NONCLUSTERED (idEmpleado)
)
go


/* 
 * TABLE: BRAZALETE 
 */

CREATE TABLE BRAZALETE(
    id_brazalete          numeric(10, 0)    NOT NULL,
    EstatusComida         varchar(25)       NOT NULL,
    EstatusMedicamento    varchar(25)       NOT NULL,
    CuidadosEspeciales    varchar(25)       NOT NULL,
    CONSTRAINT idBrazalete PRIMARY KEY NONCLUSTERED (id_brazalete)
)
go


/* 
 * TABLE: COMPRA 
 */

CREATE TABLE COMPRA(
    idCompra     numeric(10, 0)    NOT NULL,
    tipo         char(1)           NOT NULL constraint tipo_compra check (tipo='L' or tipo='F'),
    total        money             NOT NULL,
    idCliente    numeric(10, 0)    NOT NULL,
    CONSTRAINT idCompra PRIMARY KEY NONCLUSTERED (idCompra)
)
go



/* 
 * TABLE: COMPRA_PRODUCTO 
 */

CREATE TABLE COMPRA_PRODUCTO(
    idCompra      numeric(10, 0)    NOT NULL,
    idProducto    numeric(10, 0)    NOT NULL,
    cantidad      int               NOT NULL,
    subtotal      money             NOT NULL,
    CONSTRAINT idCompraProducto PRIMARY KEY NONCLUSTERED (idCompra, idProducto)
)
go



/* 
 * TABLE: CONSULTA 
 */

CREATE TABLE CONSULTA(
    id_consulta    numeric(10, 0)    NOT NULL,
    detalles       varchar(35)       NOT NULL,
    fechaHora      datetime          NOT NULL,
    diagnostico    varchar(25)       NOT NULL,
    idEmpleado     numeric(10, 0)    NOT NULL,
    CONSTRAINT idConsulta PRIMARY KEY NONCLUSTERED (id_consulta)
)
go



/* 
 * TABLE: CUIDADOR 
 */

CREATE TABLE CUIDADOR(
    idEmpleado    numeric(10, 0)    NOT NULL,
    edad          numeric(3, 0)     NOT NULL,
    usuario       varchar(30)       NOT NULL,
    contraseña    varchar(20)       NOT NULL,
    especie       char(1)           NOT NULL constraint especie check(especie='P' or especie='G'),
    CONSTRAINT idCuidador PRIMARY KEY NONCLUSTERED (idEmpleado)
)
go


/* 
 * TABLE: EMPLEADO 
 */

CREATE TABLE EMPLEADO(
    idEmpleado      numeric(10, 0)    NOT NULL,
    tipoEmpleado    char(1)           NULL,
    CURP            varchar(18)       NOT NULL,
    aMaterno        varchar(20)       NOT NULL,
    aPaterno        varchar(20)       NOT NULL,
    nombre          varchar(20)       NOT NULL,
    calle           varchar(20)       NOT NULL,
    numero          int               NOT NULL,
    colonia         varchar(25)       NOT NULL,
    idGuarderia  numeric(10, 0)    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (idEmpleado)
)
go


/* 
 * TABLE: FISICA 
 */

CREATE TABLE FISICA(
    idCompra      numeric(10, 0)    NOT NULL,
    comision      money             NOT NULL,
    idEmpleado    numeric(10, 0)    NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (idCompra)
)
go


/* 
 * TABLE: GUARDERIA 
 */

CREATE TABLE GUARDERIA(
    idGuarderia      numeric(10, 0)    NOT NULL,
    telefono             numeric(10, 0)    NOT NULL,
    calle                varchar(20)       NOT NULL,
    numero               int               NOT NULL,
    colonia              varchar(25)       NOT NULL,
    estado               varchar(10)       NOT NULL,
    oficinaRegional      char(1)          NOT NULL constraint Regional check(oficinaRegional='S' or oficinaRegional='N'),
    idEmpleadoGerente    numeric(10, 0)    NULL,
    CONSTRAINT PK18 PRIMARY KEY NONCLUSTERED (idGuarderia)
)
go




/* 
 * TABLE: LINEA 
 */

CREATE TABLE LINEA(
    idCompra       numeric(10, 0)    NOT NULL,
    status         char(2)           NOT NULL constraint Regional check(status in ('PA','P','C')),
    cancelacion    numeric(10, 0)    NOT NULL,
    monto          numeric(10, 0)    NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (idCompra)
)
go



/* 
 * TABLE: MASCOTA 
 */

CREATE TABLE MASCOTA(
    id_mascota               numeric(10, 0)    NOT NULL,
    sexo                     char(1)           NOT NULL constraint sexo check (sexo='M' or sexo='H'),
    nombre                   varchar(10)       NOT NULL,
    especie                  char(1)           NOT NULL constraint especie check(especie='P' or especie='G'),
    edad                     tinyint           NOT NULL,
    rasgosCaracteristicos    varchar(30)       NOT NULL,
    raza                     varchar(20)       NOT NULL,
    id_brazalete             numeric(10, 0)    NOT NULL,
    idCliente                numeric(10, 0)    NOT NULL,
    idVeterinario            numeric(10, 0)    NOT NULL,
    idCuidador               numeric(10, 0)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (id_mascota)
)
go


/* 
 * TABLE: Medicamento 
 */

CREATE TABLE Medicamento(
    idMedicamento        numeric(10, 0)    NOT NULL,
    costo                money             NOT NULL,
    nombreMedicamento    varchar(30)       NOT NULL,
    CONSTRAINT PK25 PRIMARY KEY NONCLUSTERED (idMedicamento)
)
go


/* 
 * TABLE: MEDICION 
 */

CREATE TABLE MEDICION(
    id_medicion      numeric(10, 0)    NOT NULL,
    ritmoCardiaco    numeric(3, 0)     NOT NULL,
    fechaHora        datetime          NOT NULL,
    nivelOxigeno     numeric(3, 0)     NOT NULL,
    temperatura      numeric(3, 0)     NOT NULL,
    id_brazalete     numeric(10, 0)    NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (id_medicion)
)
go

/* 
 * TABLE: OFERTA 
 */

CREATE TABLE OFERTA(
    idOferta       numeric(10, 0)    NOT NULL,
    descripcion    varchar(30)       NOT NULL,
    fechaInicio    datetime          NOT NULL,
    fechaFin       datetime          NOT NULL,
    tipoOferta     char(1)           NOT NULL constraint tipo check (tipoOferta='N' or tipoOferta='L'),
    idProducto     numeric(10, 0)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (idOferta),
	constraint vigente check (fechaFin-fechaInicio<=40)
)
go




/* 
 * TABLE: PRODUCTO 
 */

CREATE TABLE PRODUCTO(
    idProducto     numeric(10, 0)     NOT NULL,
    precio         money              NOT NULL,
    descripcion    varchar(25)        NOT NULL,
    descuento      numeric(100, 0)    NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (idProducto)
)
go




/* 
 * TABLE: RECIBO_VET 
 */

CREATE TABLE RECIBO_VET(
    folioRecibo    numeric(10, 0)    NOT NULL,
    fecha          datetime          NOT NULL,
    id_consulta    numeric(10, 0)    NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (folioRecibo)
)
go



/* 
 * TABLE: TRATAMIENTO 
 */

CREATE TABLE TRATAMIENTO(
    id_tratamiento    numeric(10, 0)    NOT NULL,
    cantidad          smallint          NOT NULL,
    dosis             varchar(30)       NOT NULL,
    idMedicamento     numeric(10, 0)    NOT NULL,
    id_consulta       numeric(10, 0)    NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (id_tratamiento)
)
go



/* 
 * TABLE: USUARIO 
 */

CREATE TABLE USUARIO(
    idCliente     numeric(10, 0)    NOT NULL,
    nombre        varchar(20)       NOT NULL,
    Apaterno      varchar(20)       NOT NULL,
    Amaterno      varchar(20)       NOT NULL,
    CURP          varchar(18)       NOT NULL,
    contrasena    varchar(16)       NOT NULL,
    noTarjeta     numeric(19, 0)    NOT NULL,
    genero        char(1)           NOT NULL constraint genero check (genero='M' or genero='F'),
    telefono      numeric(10, 0)    NOT NULL,
    correo        varchar(30)       NOT NULL,
    nomUsuario    varchar(20)       NOT NULL,
    calle         varchar(20)       NOT NULL,
    numero        int               NOT NULL,
    colonia       varchar(25)       NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (idCliente)
)
go



/* 
 * TABLE: VENDEDOR 
 */

CREATE TABLE VENDEDOR(
    idEmpleado    numeric(10, 0)    NOT NULL,
    pago          money             NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (idEmpleado)
)
go



/* 
 * TABLE: VETERINARIO 
 */

CREATE TABLE VETERINARIO(
    idEmpleado      numeric(10, 0)    NOT NULL,
    especialidad    varchar(15)       NOT NULL,
    NoCedula        numeric(10, 0)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (idEmpleado)
)
go



/* 
 * TABLE: ADMINISTRATIVO 
 */

ALTER TABLE ADMINISTRATIVO ADD CONSTRAINT RefEMPLEADO25 
    FOREIGN KEY (idEmpleado)
    REFERENCES EMPLEADO(idEmpleado)
go


/* 
 * TABLE: COMPRA 
 */

ALTER TABLE COMPRA ADD CONSTRAINT RefUSUARIO6 
    FOREIGN KEY (idCliente)
    REFERENCES USUARIO(idCliente)
go


/* 
 * TABLE: COMPRA_PRODUCTO 
 */

ALTER TABLE COMPRA_PRODUCTO ADD CONSTRAINT RefCOMPRA11 
    FOREIGN KEY (idCompra)
    REFERENCES COMPRA(idCompra)
go

ALTER TABLE COMPRA_PRODUCTO ADD CONSTRAINT RefPRODUCTO12 
    FOREIGN KEY (idProducto)
    REFERENCES PRODUCTO(idProducto)
go


/* 
 * TABLE: CONSULTA 
 */

ALTER TABLE CONSULTA ADD CONSTRAINT RefVETERINARIO31 
    FOREIGN KEY (idEmpleado)
    REFERENCES VETERINARIO(idEmpleado)
go


/* 
 * TABLE: CUIDADOR 
 */

ALTER TABLE CUIDADOR ADD CONSTRAINT RefEMPLEADO23 
    FOREIGN KEY (idEmpleado)
    REFERENCES EMPLEADO(idEmpleado)
go


/* 
 * TABLE: EMPLEADO 
 */

ALTER TABLE EMPLEADO ADD CONSTRAINT RefGUARDERIA28 
    FOREIGN KEY (idGuarderia)
    REFERENCES GUARDERIA(idGuarderia)
go


/* 
 * TABLE: FISICA 
 */

ALTER TABLE FISICA ADD CONSTRAINT RefCOMPRA8 
    FOREIGN KEY (idCompra)
    REFERENCES COMPRA(idCompra)
go

ALTER TABLE FISICA ADD CONSTRAINT RefVENDEDOR36 
    FOREIGN KEY (idEmpleado)
    REFERENCES VENDEDOR(idEmpleado)
go


/* 
 * TABLE: GUARDERIA 
 */

ALTER TABLE GUARDERIA ADD CONSTRAINT RefEMPLEADO44 
    FOREIGN KEY (idEmpleadoGerente)
    REFERENCES EMPLEADO(idEmpleado)
go


/* 
 * TABLE: LINEA 
 */

ALTER TABLE LINEA ADD CONSTRAINT RefCOMPRA7 
    FOREIGN KEY (idCompra)
    REFERENCES COMPRA(idCompra)
go


/* 
 * TABLE: MASCOTA 
 */

ALTER TABLE MASCOTA ADD CONSTRAINT RefBRAZALETE4 
    FOREIGN KEY (id_brazalete)
    REFERENCES BRAZALETE(id_brazalete)
go

ALTER TABLE MASCOTA ADD CONSTRAINT RefUSUARIO10 
    FOREIGN KEY (idCliente)
    REFERENCES USUARIO(idCliente)
go

ALTER TABLE MASCOTA ADD CONSTRAINT RefVETERINARIO37 
    FOREIGN KEY (idVeterinario)
    REFERENCES VETERINARIO(idEmpleado)
go

ALTER TABLE MASCOTA ADD CONSTRAINT RefCUIDADOR45 
    FOREIGN KEY (idCuidador)
    REFERENCES CUIDADOR(idEmpleado)
go


/* 
 * TABLE: MEDICION 
 */

ALTER TABLE MEDICION ADD CONSTRAINT RefBRAZALETE9 
    FOREIGN KEY (id_brazalete)
    REFERENCES BRAZALETE(id_brazalete)
go


/* 
 * TABLE: OFERTA 
 */

ALTER TABLE OFERTA ADD CONSTRAINT RefPRODUCTO14 
    FOREIGN KEY (idProducto)
    REFERENCES PRODUCTO(idProducto)
go


/* 
 * TABLE: RECIBO_VET 
 */

ALTER TABLE RECIBO_VET ADD CONSTRAINT RefCONSULTA41 
    FOREIGN KEY (id_consulta)
    REFERENCES CONSULTA(id_consulta)
go


/* 
 * TABLE: TRATAMIENTO 
 */

ALTER TABLE TRATAMIENTO ADD CONSTRAINT RefMedicamento39 
    FOREIGN KEY (idMedicamento)
    REFERENCES Medicamento(idMedicamento)
go

ALTER TABLE TRATAMIENTO ADD CONSTRAINT RefCONSULTA40 
    FOREIGN KEY (id_consulta)
    REFERENCES CONSULTA(id_consulta)
go


/* 
 * TABLE: VENDEDOR 
 */

ALTER TABLE VENDEDOR ADD CONSTRAINT RefEMPLEADO26 
    FOREIGN KEY (idEmpleado)
    REFERENCES EMPLEADO(idEmpleado)
go


/* 
 * TABLE: VETERINARIO 
 */

ALTER TABLE VETERINARIO ADD CONSTRAINT RefEMPLEADO21 
    FOREIGN KEY (idEmpleado)
    REFERENCES EMPLEADO(idEmpleado)
go



