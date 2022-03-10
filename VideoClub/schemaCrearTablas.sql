create table clientes(
	clienteId int primary key not null,
    NombresApellidos varchar(100),
    Genero Char(1),
    FechaNacimiento date,
    Direccion varchar(255),
    CodigoPostal varchar(10)
);

-- drop table clientes, alquileres, pagos, peliculas, categorias; 
-- select * from pagos;

create table alquileres(
	AlquilerId int primary key not null,
    FechaHoraRegistro datetime,
    FechaDevolucion date,
    PeliculaId int,
    ClienteId int,
    PagoId int,
    index (ClienteId),
    foreign key (ClienteId) references clientes(ClienteId),
    index (PeliculaId),
    foreign key (PeliculaId) references peliculas(PeliculaId),
    index (PagoId),
    foreign key (PagoId) references pagos(PagoId)
);

create table pagos(
	PagoId int primary key not null,
    Importe Decimal(18,2),
    Fecha datetime
);

create table peliculas(
	PeliculaId int primary key not null,
    Titulo varchar(45),
    Director varchar(45),
    Anio int,
    CategoriaId int,
    index (CategoriaId),
    foreign key (CategoriaId) references categorias(CategoriaId)
);

create table categorias(
	CategoriaId int primary key not null,
    Nombre varchar(45),
    Comentarios varchar(255)
);
