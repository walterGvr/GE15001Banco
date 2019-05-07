CREATE DATABASE Bancos;

use Bancos;

CREATE TABLE [dbo].[cliente] (
[codCliente] int NOT NULL,
[nombreCliente] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
[apellidoCliente] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
[fechaNaCliente] date NULL,
[generoCliente] varchar(2) COLLATE Modern_Spanish_CI_AS NULL,
[direccionCliente] varchar(80) COLLATE Modern_Spanish_CI_AS NULL,
[duiCliente] nchar(10) COLLATE Modern_Spanish_CI_AS NULL,
[nitCliente] nchar(10) COLLATE Modern_Spanish_CI_AS NULL,
[codTipoCliente] int NOT NULL,
CONSTRAINT [PK_cliente] PRIMARY KEY ([codCliente]) ,
CONSTRAINT [clienteContacto] FOREIGN KEY ([codCliente]) REFERENCES [dbo].[Contacto] ([codContacto]),
CONSTRAINT [clienteCuentaBanc] FOREIGN KEY ([codCliente]) REFERENCES [dbo].[CuentaBancaria] ([codCuentaBancaria])
);


CREATE TABLE [dbo].[Contacto] (
[codContacto] int NOT NULL,
[contacto] nvarchar(50) COLLATE Modern_Spanish_CI_AS NULL,
[codCliente] int NULL,
[codTipoContacto] int NULL,
CONSTRAINT [PK_Contacto] PRIMARY KEY ([codContacto]) 
);


CREATE TABLE [dbo].[CuentaBancaria] (
[codCuentaBancaria] int NOT NULL,
[numCuentaBancaria] nchar(10) COLLATE Modern_Spanish_CI_AS NULL,
[codCliente] int NULL,
[codTipoCuenta] int NULL,
CONSTRAINT [PK_CuentaBancaria] PRIMARY KEY ([codCuentaBancaria]) 
);


CREATE TABLE [dbo].[Documentos] (
[codDocumentos] int NOT NULL,
[Documentos] varchar(80) COLLATE Modern_Spanish_CI_AS NULL,
[codTipoDocumentos] int NULL,
[codTipoCliente] int NULL,
CONSTRAINT [PK_Documentos] PRIMARY KEY ([codDocumentos]) 
);


CREATE TABLE [dbo].[Tarjeta] (
[codTarjeta] int NOT NULL,
[numTarjeta] nchar(15) COLLATE Modern_Spanish_CI_AS NULL,
[codTipoTarjeta] int NULL,
[conTipoCliente] int NULL,
CONSTRAINT [PK_Tarjeta] PRIMARY KEY ([codTarjeta]) ,
CONSTRAINT [tarjetaTipoCliente] FOREIGN KEY ([codTarjeta]) REFERENCES [dbo].[TipoCliente] ([codTipoCliente])
);


CREATE TABLE [dbo].[TipoCliente] (
[codTipoCliente] int NOT NULL,
[TipoCliente] varchar(80) COLLATE Modern_Spanish_CI_AS NULL,
CONSTRAINT [PK_TipoCliente] PRIMARY KEY ([codTipoCliente]) ,
CONSTRAINT [tipoClienteDoc] FOREIGN KEY ([codTipoCliente]) REFERENCES [dbo].[Documentos] ([codDocumentos]),
CONSTRAINT [tipoClinte] FOREIGN KEY ([codTipoCliente]) REFERENCES [dbo].[cliente] ([codCliente])
);


CREATE TABLE [dbo].[TipoContacto] (
[codTipoContacto] int NOT NULL,
[TipoContacto] nchar(60) COLLATE Modern_Spanish_CI_AS NULL,
CONSTRAINT [PK_TipoContacto] PRIMARY KEY ([codTipoContacto]) ,
CONSTRAINT [TipoContactos] FOREIGN KEY ([codTipoContacto]) REFERENCES [dbo].[Contacto] ([codContacto])
);


CREATE TABLE [dbo].[TipoCuenta] (
[codTipoCuenta] int NOT NULL,
[TipoCuenta] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
CONSTRAINT [PK_TipoCuenta] PRIMARY KEY ([codTipoCuenta]) ,
CONSTRAINT [tipoCuentaCuBan] FOREIGN KEY ([codTipoCuenta]) REFERENCES [dbo].[CuentaBancaria] ([codCuentaBancaria]),
CONSTRAINT [tipoCuentaTRan] FOREIGN KEY ([codTipoCuenta]) REFERENCES [dbo].[Transaccion] ([codTransaccion])
);


CREATE TABLE [dbo].[TipoDocumento] (
[codTipoDocumento] int NOT NULL,
[TipoDocumento] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
CONSTRAINT [PK_TipoDocumento] PRIMARY KEY ([codTipoDocumento]) ,
CONSTRAINT [tipoDoc] FOREIGN KEY ([codTipoDocumento]) REFERENCES [dbo].[Documentos] ([codDocumentos])
);


CREATE TABLE [dbo].[T‬ipoTarjeta] (
[codTipoTarjeta] int NOT NULL,
[TipoTarjeta] nchar(25) COLLATE Modern_Spanish_CI_AS NULL,
CONSTRAINT [PK_T‬ipoTarjeta] PRIMARY KEY ([codTipoTarjeta]) ,
CONSTRAINT [tipoTarjeTarjeta] FOREIGN KEY ([codTipoTarjeta]) REFERENCES [dbo].[Tarjeta] ([codTarjeta])
);


CREATE TABLE [dbo].[TipoTransaccion] (
[codTipoTransaccion] int NOT NULL,
[TipoTransaccion] nchar(20) COLLATE Modern_Spanish_CI_AS NULL,
CONSTRAINT [PK_TipoTransaccion] PRIMARY KEY ([codTipoTransaccion]) ,
CONSTRAINT [tipoTransaccionTRa] FOREIGN KEY ([codTipoTransaccion]) REFERENCES [dbo].[Transaccion] ([codTransaccion])
);


CREATE TABLE [dbo].[Transaccion] (
[codTransaccion] int NOT NULL,
[montoTransaccion] nchar(15) COLLATE Modern_Spanish_CI_AS NULL,
[codCuentaBancaria] int NULL,
[codTipoTransaccion] int NULL,
[codTipoCuenta] int NULL,
CONSTRAINT [PK_Transaccion] PRIMARY KEY ([codTransaccion]) 
);


INSERT INTO cliente(
	codCliente, nombreCliente, apellidoCliente, fechaNaCliente, generoCliente, direccionCliente, duiCliente, nitCliente,codTipoCliente)
VALUES
	(1,'Jose Luis','Gomez Lopez','1999-08-07','M','San Salvador','000000001','12354645',5),
	(2,'Raul eliberto','escoria Lopez','2000-12-06','M','San Salvador','000000004','99992929',4),
	(3,'Walter Luis','Gonzalez Lopez','1994-08-07','M','San Salvador','000000051','12354645',3),
	(4,'esther Ruth','lopez Lopez','1960-11-07','F','San Marcos','00000110','99889955',2),
	(5,'Jaime armando','ramirez sanchez','2008-9-07','M','San Salvador','000000025','09578373',1),
	(6,'Maria Luisa','Guerrero Lopez','1998-12-07','F','Mejicanos','00939033','88848384',3),
	(7,'Luciana Andrea','rivera polanco','1985-12-07','F','Juayua','000005971','59274834',1),
	(8,'Rigoberto Francisco','Gutierrez vilalobos','1970-12-07','M','Santo Tomas','00000104','92415846',2),
	(9,'Amadeo antonio','carcamo Lopez','1950-12-07','M','San Jacinto','00106001','79541334',2),
	(10,'Emili Roxana','Hernandez Montalvo','1977-12-07','F','Ilopango','000002931','94763375',4);


	INSERT INTO TipoCliente(
	codTipoCliente,codTipoCliente)
VALUES
	(1,'Inversionista'),
	(2,'Asalariado'),
	(3,'Rentista'),
	(4,'Profesional Independiente'),
	(5,'Asalariado'),
	(6,'Rentista'),
	(7,'Inversionista'),
	(8,'Profesional Independiente'),
	(9,'Rentista'),
	(10,'Profesional Independiente');



INSERT INTO Contacto(
	codContacto, contacto,codCliente,codTipoContacto)
VALUES
	(1,'22222222',7,2),
	(2,'76773222',8,1),
	(3,'23453237',4,1),
	(4,'22678448',3,2),
	(5,'22556784',9,1),
	(6,'76784584',5,2),
	(7,'78838393',2,1),
	(8,'22456764',1,1),
	(9,'22567976',1,2),
	(10,'22457605',10,1);
	
INSERT INTO TipoContacto(
	codTipoContacto, TipoContacto)
VALUES
	(1,'Telefono Fijo'),
	(2,'Celular'),
	(3,'Telefono Fijo'),
	(4,'Telefono Fijo'),
	(5,'Telefono Fijo'),
	(6,'Celular'),
	(7,'Celular'),
	(8,'Telefono Fijo'),
	(9,'Telefono Fijo'),
	(10,'Telefono Fijo');
	

INSERT INTO CuentaBancaria(
	codCuentaBancaria,numCuentaBancaria,codCliente,codTipoCuenta)
VALUES
	(1,'124434131',9,2),
	(2,'354353454',6,1),
	(3,'565657767',5,2),
	(4,'546457656',4,1),
	(5,'786566764',5,2),
	(6,'756745773',8,1),
	(7,'345678564',5,2),
	(8,'567536463',6,1),
	(9,'674745753',7,2),
	(10,'674545775',2,1);


	INSERT INTO TipoCuenta(
	codTipoCuenta,TipoCuenta)
VALUES
	(1,'Ahorros'),
	(2,'Credito'),
	(3,'Credito'),
	(4,'Credito'),
	(5,'Ahorros'),
	(6,'Credito'),
	(7,'Ahorros'),
	(8,'Credito'),
	(9,'Ahorros'),
	(10,'Ahorros');

	INSERT INTO Documentos(
	codDocumentos,Documentos,codTipoDocumento,codTipoCliente)
VALUES
	(1,'Completos',9,4),
	(2,'Completos',7,1),
	(3,'Incompletos',6,2),
	(4,'Incompletos',5,3),
	(5,'Incompletos',9,1),
	(6,'Completos',7,3),
	(7,'Completos',8,2),
	(8,'Incompletos',7,2),
	(9,'Completos',4,3),
	(10,'Completos',2,1);

	INSERT INTO TipoDocumento(
	codTipoDocumento,TipoDocumento)
VALUES
	(1,'Recibo de luz'),
	(2,'Recibo de Agua'),
	(3,'Declaracion IVA'),
	(4,'Constancia Salarial'),
	(5,'Estado de Cuenta AFP'),
	(6,'Documentos Requeridos'),
	(7,'Documentos Requeridos'),
	(8,'Declaracion IVA'),
	(9,'Declaracion IVA'),
	(10,'Declaracion IVA');

		INSERT INTO Tarjeta(
	codTarjeta,numTarjeta, codTipoTarjeta, conTipoCliente)
VALUES
	(1,'12454343',2,4),
	(2,'12464454',1,2),
	(3,'65678568',2,1),
	(4,'98756455',1,2),
	(5,'64634525',2,3),
	(6,'86735323',1,1),
	(7,'76563432',2,3),
	(8,'65424523',1,4),
	(9,'25254545',2,1),
	(10,'63634523',1,4);

		INSERT INTO tipoTarjeta(
	codTipoTarjeta,TipoTarjeta)
VALUES
	(1,'Debito'),
	(2,'Credito'),
	(3,'Credito'),
	(4,'Credito'),
	(5,'Debito'),
	(6,'Credito'),
	(7,'Debito'),
	(8,'Credito'),
	(9,'Debito'),
	(10,'Debito');

	INSERT INTO Transaccion(
	codTransaccion,montoTransaccion,codTipoTransaccion,codTipoCuenta)
VALUES
	(1,'200',1,2),
	(2,'400',2,2),
	(3,'566',1,1),
	(4,'600',2,1),
	(5,'800',1,2),
	(6,'100',1,1),
	(7,'40',1,2),
	(8,'35',2,1),
	(9,'45',2,1),
	(10,'70',2,1);

	INSERT INTO TipoTransaccion(
	codTipoTransaccion,TipoTransaccion)
VALUES
	(1,'Bancaria'),
	(2,'Remesa'),
	(3,'Bancaria'),
	(4,'Remesa'),
	(5,'Bancaria'),
	(6,'Bancaria'),
	(7,'Remesa'),
	(8,'Remesa'),
	(9,'Bancaria'),
	(10,'Remesa');