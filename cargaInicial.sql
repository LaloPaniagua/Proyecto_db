------------------------------------- INSERTS ----------------------------------------------

use proyecto_db_guarderia
go

--Usuarios registrados
INSERT INTO USUARIO (idCliente, nombre, Apaterno, Amaterno, CURP, contrasena, noTarjeta, genero, telefono, correo, nomUsuario, calle, numero, colonia)
VALUES
  (1, 'Juan', 'Pérez', 'González', 'ABCD1234567890', 'password1', '1234567890', 'M', '5551234567', 'juan@example.com', 'juanperez', 'Calle 1', '123', 'Colonia A'),
  (2, 'María', 'García', 'López', 'EFGH1234567890', 'securepass2', '0987654321', 'F', '5559876543', 'maria@example.com', 'mariagarcia', 'Avenida 2', '456', 'Fraccionamiento B'),
  (3, 'Carlos', 'Rodríguez', 'Sánchez', 'IJKL1234567890', 'strongpassword3', '1357924680', 'M', '5557890123', 'carlos@example.com', 'carlosrodriguez', 'Calle 3 Sur', '789', 'Colonia Céntrica'),
  (4, 'Luis', 'López', 'Hernández', 'MNOP1234567890', 'password4', '9876543210', 'M', '5555432109', 'luis@example.com', 'luislopez', 'Boulevard 4', '246', 'Residencial D'),
  (5, 'Ana', 'Martínez', 'Flores', 'QRST1234567890', 'safepass5', '4567890123', 'F', '5556789012', 'ana@example.com', 'anamartinez', 'Calle 5 Norte', '135', 'Colonia Elegante'),
  (6, 'Pedro', 'Gómez', 'Ruiz', 'UVWX1234567890', 'password6', '7890123456', 'M', '5558901234', 'pedro@example.com', 'pedrogomez', 'Callejón 6', '802', 'Colonia Fénix'),
  (7, 'Sofía', 'López', 'Torres', 'YZAB1234567890', 'strongpass7', '9876543210', 'F', '5556789012', 'sofia@example.com', 'sofialopez', 'Avenida 7 Oeste', '413', 'Fraccionamiento G'),
  (8, 'José', 'Ramírez', 'Jiménez', 'CDEF1234567890', 'password8', '4567890123', 'M', '5555432109', 'jose@example.com', 'joseramirez', 'Paseo 8', '226', 'Colonia Hidalgo'),
  (9, 'Mónica', 'Pérez', 'González', 'GHIJ1234567890', 'securepass9', '7890123456', 'F', '5558901234', 'monica@example.com', 'monicaperez', 'Calle 9 Poniente', '639', 'Fraccionamiento I'),
  (10, 'Andres', 'González', 'Hernández', 'KLMN1234567890', 'password10', '1234567890', 'M', '5551234567', 'andres@example.com', 'andresgonzalez', 'Calle 10', '724', 'Colonia J'),
  (11, 'Laura', 'Martínez', 'Sánchez', 'OPQR1234567890', 'password11', '0987654321', 'M', '5559876543', 'laura@example.com', 'lauramartinez', 'Avenida 11', '810', 'Fraccionamiento K'),
  (12, 'David', 'Torres', 'Flores', 'STUV1234567890', 'password12', '1357924680', 'M', '5557890123', 'david@example.com', 'davidtorres', 'Boulevard 12', '947', 'Residencial L'),
  (13, 'Martha', 'Gómez', 'López', 'WXYZ1234567890', 'password13', '9876543210', 'F', '5550123456', 'martha@example.com', 'marthagomez', 'Callejón 13', '539', 'Colonia M'),
  (14, 'Jorge', 'Hernández', 'Ramírez', 'ABCD0987654321', 'password14', '4567890123', 'F', '5556789012', 'jorge@example.com', 'jorgehernandez', 'Avenida 14', '625', 'Fraccionamiento N'),
  (15, 'Daniela', 'Rodríguez', 'López', 'EFGH0987654321', 'password15', '7890123456', 'F', '5555432109', 'daniela@example.com', 'danielarodriguez', 'Calle 15', '721', 'Colonia O');

  SELECT COUNT(*) AS idCliente
  FROM USUARIO;
  SELECT * FROM USUARIO;


--Guardería
	SELECT * FROM GUARDERIA;
INSERT INTO GUARDERIA (idGuarderia, telefono, calle, numero, colonia, estado, oficinaRegional)
VALUES
    (1, '3466857211', 'Rosa', '123', 'Del Valle', 'CDMX', 'S'),
    (2, '8836214092', 'Tulipán', '456', 'El Campanario', 'Querétaro', 'N'),
    (3, '6612485032', 'Orquídea', '789', 'Lomas de Angelópolis', 'Puebla', 'S'),
    (4, '9872541169', 'Girasol', '012', 'Polanco', 'Nuevo León', 'N'),
    (5, '0218754268', 'Lirio', '345', 'San Pedro Garza García', 'Nuevo León', 'S');

	SELECT COUNT(*) AS telefono
	FROM GUARDERIA;
	SELECT * FROM GUARDERIA;


--Gestores 10
INSERT INTO EMPLEADO (idEmpleado, tipoEmpleado, CURP, aMaterno, aPaterno, nombre, calle, numero, colonia, idguarderia)
VALUES
    (1, 'CUI', 'ABC123', 'González', 'Pérez', 'Juan', 'Calle 1', '123', 'Miramontes', 1),
    (2, 'CUI', 'XYZ456', 'López', 'Gómez', 'María', 'Calle 2', '456', 'Olimpo', 4),
    (3, 'CUI', 'DEF789', 'Hernández', 'Rodríguez', 'Pedro', 'Calle 3', '789', 'Marvella', 2),
    (4, 'CUI', 'MNO012', 'Martínez', 'López', 'Laura', 'Calle 4', '012', 'Canada', 3),
    (5, 'CUI', 'PQR345', 'García', 'Torres', 'José', 'Calle 5', '345', 'Amapola', 3),
    (6, 'CUI', 'STU678', 'Rivera', 'Sánchez', 'Ana', 'Calle 6', '678', 'Miramontes', 1),
    (7, 'CUI', 'VWX901', 'Morales', 'Ramírez', 'Carlos', 'Calle 7', '901', 'Colonia G', 5),
    (8, 'CUI', 'YZA234', 'Silva', 'González', 'María', 'Calle 8', '234', 'Amapola', 4),
    (9, 'CUI', 'BCD567', 'Gómez', 'Pérez', 'Luis', 'Calle 9', '567', 'Río verde', 2),
    (10, 'CUI', 'EFG890', 'Ortega', 'García', 'Fernanda', 'Calle 10', '890', 'Colonia J', 5);


	SELECT COUNT(*) AS CURP
	FROM EMPLEADO;
	SELECT * FROM EMPLEADO;

	--Gerentes 
		Update GUARDERIA
	set idEmpleadoGerente = 1
	where idGuarderia = 1
	Update GUARDERIA
	set idEmpleadoGerente = 2
	where idGuarderia = 2
	Update GUARDERIA
	set idEmpleadoGerente = 3
	where idGuarderia = 3
	Update GUARDERIA
	set idEmpleadoGerente = 4
	where idGuarderia = 4
	Update GUARDERIA
	set idEmpleadoGerente = 5
	where idGuarderia = 5

--Vendedores 5
INSERT INTO EMPLEADO (idEmpleado, tipoEmpleado, CURP, aMaterno, aPaterno, nombre, calle, numero, colonia, idguarderia)
VALUES
    (11, 'VEN', 'GHI123', 'Hernández', 'Gómez', 'Miguel', 'Calle 11', '111', 'Río verde',4),
    (12, 'VEN', 'JKL456', 'Sánchez', 'García', 'Patricia', 'Calle 12', '222', 'Caminero',2),
    (13, 'VEN', 'MNO789', 'Martínez', 'López', 'Sara', 'Calle 13', '333', 'Centeno', 3),
    (14, 'VEN', 'PQR012', 'González', 'Hernández', 'Roberto', 'Calle 14', '444', 'Marvella',5),
    (15, 'VEN', 'STU345', 'Vargas', 'Torres', 'Isabel', 'Calle 15', '555', 'Río verde',1);

INSERT INTO VENDEDOR (idEmpleado, pago)
VALUES
	(11, 1500),
	(12, 2300),
	(13, 5000),
	(14, 1500),
	(15, 2300);

	SELECT COUNT(*) AS pago
	FROM VENDEDOR;
	SELECT * FROM EMPLEADO;
	SELECT * FROM VENDEDOR;

--Categorias
INSERT INTO PRODUCTO (idProducto, precio, descripcion,idGuarderia) VALUES
    (1, 180, 'Nuevo',1),
	(2, 50, 'Nuevo',2),
	(3, 290, 'Nuevo',3),
	(4, 370, 'Nuevo',4),
	(5, 64, 'Nuevo',5),
    (6, 26, 'Temporada',1),
	(7, 49, 'Temporada',1),
	(8, 115, 'Temporada',2),
	(9, 432, 'Temporada',2),
	(10, 128, 'Temporada',3),
    (11, 72, 'Mas vendido',3),
	(12, 450, 'Mas vendido',4),
	(13, 110, 'Mas vendido',5),
	(14, 240, 'Mas vendido',5),
	(15, 200, 'Mas vendido',2),
    (16, 100, 'Stock',3),
	(17, 88, 'Stock',1),
	(18, 605, 'Stock',2),
	(19, 93, 'Stock',4),
	(20, 140, 'Stock',5);

	SELECT COUNT(*) AS idProducto
	FROM PRODUCTO;
SELECT * FROM PRODUCTO;

--VENTAS PARA USUARIOS REGISTRADOS
INSERT INTO COMPRA (idCompra, idCliente, tipo, total,fechaCompra, status) VALUES
  (1, 1, 'F', 4500,'2023-01-01', 'PA'),
  (2, 1, 'L', 1000,'2023-01-02','P'),
  (3, 1, 'F', 4568,'2023-02-03','C'),
  (4, 2, 'L', 1212,'2023-02-04','P'),
  (5, 3, 'F', 1152,'2023-02-05','P'),
  (6, 3, 'F', 4125,'2023-03-06','P'),
  (7, 4, 'L', 3142,'2023-03-07','P'),
  (8, 5, 'F', 5000,'2023-03-08','C'),
  (9, 6, 'L', 6450,'2023-03-09','C'),
  (10, 7, 'F', 4215,'2023-03-10','C'),
  (11, 8, 'F', 6415,'2023-03-11','PA'),
  (12, 9, 'L', 1236,'2023-04-12','PA'),
  (13, 10, 'F', 3355,'2023-04-13','PA'),
  (14, 11, 'L', 4465,'2023-04-14','P'),
  (15, 12, 'F', 1548,'2023-04-15','P'),
  (16, 13, 'F', 6541,'2023-04-16','P'),
  (17, 14, 'L', 8945,'2023-04-17','PA'),
  (18, 15, 'F', 4512,'2023-05-18','PA'),
  (19, 7, 'L', 4561,'2023-06-19','C'),
  (20, 10, 'F', 7600,'2023-07-20','C');

  	SELECT COUNT(*) AS total
	FROM COMPRA;
SELECT * FROM COMPRA;

-- VENTAS EN ESTABLECIMIENTO
INSERT INTO FISICA (idCompra, idEmpleado, comision)
VALUES
    (1, 11, 100),
    (2, 12, 200),
    (3, 13, 50),
    (4, 14, 150),
    (5, 15, 300),
    (6, 11, 75),
    (7, 12, 250),
    (8, 13, 125),
    (9, 14, 175),
    (10, 15, 340);

	SELECT COUNT(*) AS idcompra
	FROM FISICA;
SELECT * FROM FISICA;

--OFERTAS
INSERT INTO OFERTA (idOferta, descripcion, fechaInicio, fechaFin, tipoOferta, idProducto) VALUES
  (1, 'Oferta especial de verano', '2023-01-01', '2023-01-31', 'N', 1),
  (2, 'Descuento del 20 porciento', '2023-02-05', '2023-02-10', 'L', 5),
  (3, 'Oferta de temporada: 2x1', '2023-03-10', '2023-03-15', 'N', 10),
  (4, 'Descuento del 10 porciento', '2023-04-15', '2023-04-20', 'L', 15),
  (5, 'Oferta para clientes VIP', '2023-05-20', '2023-05-25', 'N', 17),
  (6, 'Descuento del 30 porciento', '2023-06-25', '2023-06-30', 'L', 19),
  (7, 'Oferta flash: 50 porciento', '2023-06-28', '2023-06-29', 'N', 20);

  SELECT COUNT(*) AS idProducto
	FROM OFERTA;
SELECT * FROM OFERTA;

--CESTAS PENDIENTES DE COMPRA
INSERT INTO COMPRA (idCompra, tipo, total, idCliente,fechaCompra,status) VALUES
    (98, 'L', 1520, 1,'2023-07-21','P'),
    (129, 'L', 87, 4,'2023-07-22','P'),
    (102, 'L', 49, 9,'2023-08-23','P'),
    (92, 'L', 140, 11,'2023-08-24','P'),
    (115, 'L', 93, 14,'2023-08-25','P');

	SELECT COUNT(*) AS tipo
	FROM COMPRA;
SELECT * FROM COMPRA;


INSERT INTO ADMINISTRATIVO (idEmpleado, genero, telefono, correo, NoTarjeta, VigenciaTarjeta)
VALUES
    (6, 'M', '1234567890', 'pedro@example.com', '1234567812345678', '06/24'),
    (7, 'F', '2345678901', 'sofia@example.com', '2345678923456789', '09/23'),
    (8, 'M', '3456789012', 'jose@example.com', '3456789034567890', '12/25'),
    (9, 'F', '4567890123', 'monica@example.com', '4567890145678901', '03/22'),
    (10, 'M', '5678901234', 'andres@example.com', '5678901256789012', '08/23');

	SELECT COUNT(*) AS correo
	FROM ADMINISTRATIVO;
SELECT * FROM ADMINISTRATIVO;


INSERT INTO BRAZALETE (EstatusComida, EstatusMedicamento, CuidadosEspeciales,FechaIngreso)
VALUES
    ('Ya comió', 'Sin tratamiento', 'Sin cuidados','2022-01-01'),
    ('Comió poco', 'Por administrar', 'Sin cuidados','2022-01-03'),
    ('Croquetas con vitamina', 'Por administrar', 'Medicina cada hora','2022-01-09'),
    ('Sin comer', 'Sin tratamiento', 'Revisar presión','2022-03-16'),
    ('Ya comió', 'Administrado', 'Sin cuidados','2022-03-21'),
    ('Comió poco', 'Por administrar', 'Sin cuidados','2022-04-18'),
    ('Croquetas con vitamina', 'Por administrar', 'Medicina cada hora','2022-05-27'),
    ('Sin comer', 'Sin tratamiento', 'Revisar presión','2022-06-07');

	SELECT COUNT(*) AS EstatusComida
	FROM BRAZALETE;
SELECT * FROM BRAZALETE;

INSERT INTO COMPRA (idCompra, tipo, total, idCliente,fechaCompra,status)
VALUES
    (100, 'F', 500, 1,'2023-08-26','PA' ),
    (101, 'L', 2500, 8,'2023-09-27','C'),
    (082, 'F', 1200, 3,'2023-09-28','C'),
    (103, 'L', 800, 15,'2023-10-29','P'),
    (104, 'F', 1500, 9,'2023-10-30','P'),
    (105, 'L', 3000, 6,'2023-11-30','P'),
    (106, 'F', 900, 7,'2023-11-01','P'),
    (107, 'L', 1800, 8, '2023-11-02','P'),
    (108, 'F', 600, 1, '2023-12-03','P'),
    (109, 'L', 2000, 10, '2023-12-04','P' ),
    (110, 'F', 1100, 9, '2023-12-05','P'),
    (111, 'L', 5000, 12,'2023-12-06','P');
	
	SELECT COUNT(*) AS total
	FROM COMPRA;
SELECT * FROM COMPRA;

INSERT INTO COMPRA_PRODUCTO (idCompra, idProducto, cantidad, subtotal)
VALUES
    (1, 1, 3, 500),
    (1, 8, 2, 820),
    (1, 3, 1, 264),
    (2, 8, 4, 1543),
    (2, 5, 2, 700),
    (2, 6, 1, 400),
    (3, 1, 5, 2100),
    (3, 8, 3, 1200),
    (3, 9, 1, 360),
    (4, 7, 2, 605),
    (4, 11, 1, 300),
    (4, 12, 1, 420);

	SELECT COUNT(*) AS total
	FROM COMPRA;
SELECT * FROM COMPRA_PRODUCTO;

INSERT INTO EMPLEADO (idEmpleado, tipoEmpleado, CURP, aMaterno, aPaterno, nombre, calle, numero, colonia,idguarderia)
VALUES
	(16, 'VET', 'ABC123', 'López', 'González', 'Juan', 'Calle 1', '123', 'Colonia A',5),
	(17, 'VET', 'DEF456', 'Gómez', 'Rodríguez', 'María', 'Calle 2', '456', 'Colonia B',5),
	(18, 'VET', 'GHI789', 'Hernández', 'Martínez', 'Pedro', 'Calle 3', '789', 'Colonia C',2),
	(19, 'VET', 'JKL012', 'Ramírez', 'López', 'Ana', 'Calle 4', '012', 'Colonia D',3),
	(20, 'VET', 'MNO345', 'Torres', 'García', 'Luis', 'Calle 5', '345', 'Colonia E',1),
	(21, 'VET', 'PQR678', 'Ríos', 'Fernández', 'Carolina', 'Calle 6', '678', 'Colonia F',4),
	(22, 'VET', 'STU901', 'Guzmán', 'Sánchez', 'Roberto', 'Calle 7', '901', 'Colonia G',3),
	(23, 'VET', 'VWX234', 'Silva', 'López', 'Laura', 'Calle 8', '234', 'Colonia H',4),
	(24, 'VET', 'YZA567', 'Ortega', 'González', 'Diego', 'Calle 9', '567', 'Colonia I',1);


INSERT INTO VETERINARIO (idEmpleado, especialidad, NoCedula)
VALUES
    (16, 'Cirugía', 1234567890),
    (17, 'Rehabilitación', 2345678901),
    (18, 'Oncología', 3456789012),
    (19, 'Fisioterapia', 4567890123),
    (20, 'Cirugía', 5678901234),
    (21, 'Rehabilitación', 6789012345),
    (22, 'Oncología', 7890123456),
    (23, 'Fisioterapia', 8901234567),
	(24, 'Cirugía', 5412950876);


SELECT * FROM VETERINARIO;

INSERT INTO CONSULTA (id_consulta, detalles, fechaHora, diagnostico, idEmpleado)
VALUES
    (1, '-', '10-06-2023 10:30:45', 'Sano', 16),
    (2, 'paciente con sintomas', '11-06-2023 14:15:20', 'Moquillo', 17),
    (3, 'paciente desnutrido', '5-12-2023 08:45:55', 'Administrar tratamiento', 18),
    (4, '-', '01-05-2023 18:20:10', 'Dermatitis', 19),
    (5, 'paciente con sintomas', '03-14-2023 12:05:30', 'Moquillo', 20),
    (6, '-', '06-30-2023 16:55:15', 'Gripe', 21),
    (7, 'paciente desnutrido', '06-16-2023 09:10:25', 'Conjuntivitis', 22),
    (8, '-', '08-22-2023 20:40:50', 'Dermatitis', 23),
    (9, 'paciente con sintomas', '07-23-2023 07:25:00', 'Dermatitis', 24),
    (10, 'paciente desnutrido', '10-01-2023 23:59:59', 'Alergia', 16),
    (11, '-', '01-20-2023 06:30:00', 'Dermatitis', 17),
    (12, 'paciente con sintomas', '11-11-2023 15:45:30', 'Otitis', 18),
    (13, '-', '04-15-2023 11:11:11', 'Leishmaniosis', 19),
    (14, 'paciente desnutrido', '03-19-2023 19:05:55', 'Dermatitis', 20),
    (15, '-', '05-25-2023 04:20:00', 'Moquillo', 21);

	SELECT COUNT(*) AS diagnostico
	FROM CONSULTA;
SELECT * FROM CONSULTA;

INSERT INTO EMPLEADO (idEmpleado, tipoEmpleado, CURP, aMaterno, aPaterno, nombre, calle, numero, colonia,idguarderia)
VALUES
	(25, 'CUI', 'ABC123', 'López', 'González', 'Juan', 'Huehuetoca', '123', 'Venustiano Carranza',4),
	(26, 'CUI', 'DEF456', 'Gómez', 'Rodríguez', 'María', 'Telecomm', '456', 'Pintores',1),
	(27, 'CUI', 'GHI789', 'Hernández', 'Martínez', 'Pedro', 'Calle 13', '789', 'Niño Artillero',5),
	(28, 'CUI', 'JKL012', 'Ramírez', 'López', 'Ana', 'Playa Linda', '012', 'Xalostoc',3),
	(29, 'CUI', 'MNO345', 'Torres', 'García', 'Luis', 'Mariposa', '345', 'Miramar',3),
	(30, 'CUI', 'PQR678', 'Ríos', 'Fernández', 'Carolina', 'Chimalpopoca', '678', 'Villancicos',3),
	(31, 'CUI', 'STU901', 'Guzmán', 'Sánchez', 'Roberto', 'Oriente 116', '901', 'Calamares',5),
	(32, 'CUI', 'VWX234', 'Silva', 'López', 'Laura', 'Cazadores', '234', 'Niño Artillero',1),
	(33, 'CUI', 'YZA567', 'Ortega', 'González', 'Diego', 'Iman', '567', 'Pintores',1),
	(34, 'CUI', 'BCD890', 'García', 'Hernández', 'Marcela', 'Casanova', '890', 'Cervantina',4),
	(35, 'CUI', 'EFG123', 'Pérez', 'Martínez', 'Andrés', 'Herreros', '123', 'Cervaantina',2),
	(36, 'CUI', 'HIJ456', 'Luna', 'Flores', 'Sara', 'Papagayo', '456', 'Castañuelas',2),
	(37, 'CUI', 'KLM789', 'Vargas', 'Ramírez', 'Javier', 'Calle Génova', '789', 'Venustiano Carranza',1),
	(38, 'CUI', 'NOP012', 'Flores', 'Hernández', 'María', 'Patricio Estrada', '012', 'Quetzal',2),
	(39, 'CUI', 'QRS345', 'Rojas', 'Gómez', 'Ricardo', 'Ejercito', '345', 'Xalostoc',5),
	(40, 'CUI', 'TUV678', 'Mendoza', 'Silva', 'Fernanda', 'Sonora', '678', 'Linda Vista',1),
	(41, 'CUI', 'WXY901', 'Juárez', 'López', 'Carlos', '23 de Julio', '901', 'Cantaros',5),
	(42, 'CUI', 'ZAB234', 'Sánchez', 'García', 'Mariana', 'Batalla de Puebla', '234', 'Niño Artillero',4);

INSERT INTO CUIDADOR (idEmpleado, edad, usuario, contraseña, especie)
VALUES
	(25, 32, 'LoJuan', 'AbC12345', 'P'),
	(26, 28, 'GoMaria', 'DeF67890', 'G'),
	(27, 35, 'HePedro', 'GhI23456', 'P'),
	(28, 41, 'RaAna', 'JkL78901', 'G'),
	(29, 23, 'ToLuis', 'MnO34567', 'P'),
	(30, 29, 'RiCarolina', 'PqR89012', 'G'),
	(31, 37, 'GuRoberto', 'StU12345', 'P'),
	(32, 42, 'SiLaura', 'VwX67890', 'G'),
	(33, 31, 'OrDiego', 'YzA23456', 'P'),
	(34, 24, 'GaMarcela', 'BcD78901', 'G'),
	(35, 40, 'PeAndres', 'EfG34567', 'P'),
	(36, 27, 'LuSara', 'HiJ89012', 'G'),
	(37, 33, 'VaJavier', 'KlM12345', 'P'),
	(38, 38, 'FlMaria', 'NpQ67890', 'G'),
	(39, 26, 'RoRicardo', 'RsT23456', 'P'),
	(40, 45, 'MeFernanda', 'UvW78901', 'G'),
	(41, 30, 'JuCarlos', 'XyZ34567', 'P'),
	(42, 36, 'SaMariana', 'AbC89012', 'G');

	SELECT COUNT(*) AS usuario
	FROM CUIDADOR;
SELECT * FROM CUIDADOR;

INSERT INTO LINEA (idCompra, cancelacion)
VALUES
	(11,1500),
	(12, 980),
	(13,2500),
	(14,720),
	(15,1350),
	(16,2000),
	(17,550),
	(18,760),
	(19,2100),
	(20,900);

	SELECT COUNT(*) AS cancelacion
	FROM LINEA;
SELECT * FROM LINEA;



INSERT INTO MASCOTA (id_mascota, sexo, nombre, especie, edad, rasgosCaracteristicos, raza, id_brazalete, idCliente, idVeterinario, idCuidador)
VALUES
	(1, 'M', 'Max', 'P', 5, 'Lunar grande cara', 'Golden Retriever', '01', 4, 18, 27),
	(2, 'H', 'Luna', 'G', 8, 'Dos manchas negras', 'Siamés', '02', 2, 22, 32),
	(3, 'M', 'Rocky', 'P', 3, 'Cola larga', 'Bulldog Francés', '03', 6, 20, 39),
	(4, 'H', 'Bella', 'G', 10, 'Iperactivo', 'Persa', '04', 1, 17, 30),
	(5, 'M', 'Leo', 'P', 7, 'Muerde los tenis', 'Labrador Retriever', '05', 7, 19, 35),
	(6, 'H', 'Mia', 'G', 4, 'Con 3 patitas', 'Maine Coon', '06', 5, 24, 41),
	(7, 'M', 'Toby', 'P', 2, 'Pelaje crespo', 'Beagle', '07', 8, 21, 36),
	(8, 'H', 'Daisy', 'G', 6, 'Parece que sonrie', 'Ragdoll', '08', 3, 23, 38);
	--(9, 'M', 'Charlie', 'P', 9, 'Leal, obediente', 'Husky Siberiano', '09', 4, 24, 27),
	--(10, 'H', 'Lola', 'G', 5, 'Curiosa, ágil', 'Bengala', '10', 2, 17, 31),
	--(11, 'M', 'Maxi', 'P', 4, 'Alegre, cariñoso', 'Poodle', '11', 6, 18, 40),
	--(12, 'H', 'Lucy', 'G', 11, 'Independiente, inteligente', 'Sphynx', '12', 1, 19, 33),
	--(13, 'M', 'Oscar', 'P', 6, 'Juguetón, protector', 'Bulldog Inglés', '13', 7, 21, 42),
	--(14, 'H', 'Misty', 'G', 3, 'Dócil, sociable', 'Savannah', '14', 5, 20, 34),
	--(15, 'M', 'Buddy', 'P', 8, 'Amigable, enérgico', 'Boxer', '15', 8, 22, 37);

	SELECT COUNT(*) AS especieM
	FROM MASCOTA;
SELECT * FROM MASCOTA;

INSERT INTO Medicamento (idMedicamento, costo, nombreMedicamento)
VALUES
	('01', 1500, 'Amoxicilina'),
	('02', 980, 'Ivermectina'),
	('03', 2500, 'Metronidazol'),
	('04', 720, 'Prednisona'),
	('05', 1350, 'Cefalexina'),
	('06', 2000, 'Enrofloxacina'),
	('07', 550, 'Furosemida'),
	('08', 760, 'Meloxicam'),
	('09', 2100, 'Ranitidina'),
	('10', 900, 'Gabapentina'),
	('11', 1400, 'Clindamicina'),
	('12', 870, 'Doxiciclina'),
	('13', 2360, 'Omeprazol'),
	('14', 670, 'Tramadol'),
	('15', 1820, 'Carprofeno');

	SELECT COUNT(*) AS nombreMedicamento
	FROM Medicamento;
SELECT * FROM Medicamento;

INSERT INTO MEDICION (id_medicion, ritmoCardiaco, fechaHora, nivelOxigeno, temperatura, id_brazalete)
VALUES
	('001', 78, '06-09-2023 08:23:15', 95, 25.5, '01'),
	('002', 92, '09-29-2023 11:45:20', 98, 32.1, '02'),
	('003', 64, '10-27-2023 15:10:47', 92, 19.3, '03'),
	('004', 105, '03-10-2023 18:35:10', 97, 28.7, '04'),
	('005', 80, '07-16-2023 21:50:55', 94, 14.9, '05');

	SELECT COUNT(*) AS nivelOxigeno
	FROM MEDICION;
SELECT * FROM MEDICION;


INSERT INTO RECIBO_VET (folioRecibo, fecha, id_consulta)
VALUES
	(126, '12-09-2023', 1),
	(583, '05-29-2023', 2),
	(734, '08-11-2023', 3),
	(219, '06-25-2023', 4),
	(891, '01-07-2023', 5),
	(408, '03-14-2023', 6),
	(642, '10-15-2023', 7),
	(975, '11-03-2023', 8),
	(354, '11-13-2023', 9),
	(761, '06-26-2023', 10),
	(523, '04-23-2023', 11),
	(697, '07-20-2023', 12),
	(289, '09-01-2023', 13),
	(840, '04-09-2023', 14),
	(105, '12-05-2023', 15);

	SELECT COUNT(*) AS id_consulta
	FROM RECIBO_VET;
SELECT * FROM RECIBO_VET;

INSERT INTO TRATAMIENTO (id_tratamiento, cantidad, dosis, idMedicamento, id_consulta)
VALUES
	('01', 4, '2 veces al día', 06, 12),
	('02', 7, '1 vez al día', 09, 7),
	('03', 3, '3 veces al día', 15, 3),
	('04', 6, '2 veces al día', 03, 10),
	('05', 2, '1 vez al día', 10, 5);

	SELECT COUNT(*) AS idMedicamento
	FROM TRATAMIENTO;
SELECT * FROM TRATAMIENTO;


