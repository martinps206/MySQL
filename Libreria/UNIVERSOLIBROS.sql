CREATE database UniversoLector;

create table socio (
codigo int primary key not null, 
apellido varchar(100),
nombre varchar(100),
direccion varchar(200),
localidad varchar(100)
);

create table prestamo (
codigo int primary key not null,
codigo_socio int,
fecha datetime,
fecha_devolucion date,
fecha_tope date,
index (codigo),
foreign key (codigo_socio) references socio(codigo)
);

create table telefono_socio (
codigo int primary key not null,
numero_telefono varchar(100),
codigo_socio int,
index (codigo),
foreign key (codigo_socio) references socio(codigo)
);

create table prestamo_volumen (
codigo int primary key not null,
codigo_prestamo int,
codigo_volumen int,
index (codigo),
foreign key (codigo_prestamo) references prestamo(codigo),
foreign key (codigo_volumen) references volumen(codigo)
);

create table volumen (
codigo int primary key not null,
codigo_libro int,
deteriorado boolean,
index (codigo),
foreign key (codigo_libro) references libro(codigo)
);

create table libro (
codigo int primary key not null,
isbn varchar(13),
titulo varchar(200),
anio_escritura date,
codigo_autor int,
anio_edicion date,
codigo_editorial int,
index (codigo),
foreign key (codigo_autor) references autor(codigo),
foreign key (codigo_editorial) references editorial(codigo)
);

create table autor (
codigo int primary key not null,
nombre varchar(100),
apellido varchar(100)
);

create table editorial (
codigo int primary key not null,
razon_social varchar(100),
telefono varchar(100)
);
