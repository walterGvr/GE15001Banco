CREATE TABLE Usuario(
	codUsuario int primary key,
	nomUsuario nvarchar(50),
	apellidoUsuario  nvarchar(50),
	DirecIPUsuario nvarchar(50),
	fechaUsuario date ,
	horaUsuario time
);

CREATE TABLE Tablas(
	codTablas int primary key,
	nomTablas nvarchar(20)
);

CREATE TABLE TablaAfectada (
	codTablaAfectada int,
	codTabla int,
	codUsuario int
);

CREATE TABLE RegistroAfectado(
	codRegistroAfectado int primary key,
	numRegistroAfectado int,
	codUsuario int,
	codTabla int

);