/*Ejercicio 1
1. Crear una vista para poder organizar los envíos de las facturas. Indicar número
de factura, fecha de la factura y fecha de envío, ambas en formato dd/mm/yyyy,
valor del transporte formateado con dos decimales, y la información del
domicilio del destino incluyendo dirección, ciudad, código postal y país, en una
columna llamada Destino.*/
create view enviosPorFactura as
select FacturaID, 
date_format(FechaFactura, "%d-%m-%Y") as FechaFactura, 
date_format(FechaEnvio, "%d-%m-%Y") as FechaEnvio, 
round(transporte, 2) Transporte,
concat(direccionenvio, ' ', ciudadenvio, ' ', codigopostalenvio, ' ', paisenvio) destino
from facturas;

/*Ejercicio 2
1. Crear una vista con un detalle de los productos en stock. Indicar id, nombre del
producto, nombre de la categoría y precio unitario.*/
create view detalleProductosEnStock as
select productoId, ProductoNombre, categoriaNombre, preciounitario
from productos pp, categorias cc
where pp.categoriaId = cc.categoriaId;

/*2. Escribir una consulta que liste el nombre y la categoría de todos los productos
vendidos. Utilizar la vista creada.*/
select ProductoNombre, categoriaNombre from detalleProductosEnStock;

/*----------------------------------------------------------------------------------------------*/

-- 1. Listar todas las categorías junto con información de sus productos. Incluir todas
-- las categorías aunque no tengan productos.
select * from categorias cc left join productos pp on cc.categoriaid = pp.CategoriaID;

-- 2. Listar la información de contacto de los clientes que no hayan comprado nunca en emarket.
select cc.* from clientes cc right join facturas ff on cc.clienteid = ff.clienteid;

-- 3. Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y
-- la información de contacto de su proveedor. Tener en cuenta que puede haber
-- productos para los cuales no se indicó quién es el proveedor.
select productonombre, categoriaid, pr.Contacto from productos pp right join proveedores pr on pp.ProveedorID = pr.ProveedorID;

-- 4. Para cada categoría listar el promedio del precio unitario de sus productos.
select cc.CategoriaID, categorianombre, round(avg(PrecioUnitario), 2) promedioPrecioUnitario 
from productos pp, categorias cc 
where pp.CategoriaID = cc.CategoriaID 
group by CategoriaID;

-- 5. Para cada cliente, indicar la última factura de compra. Incluir a los clientes que nunca hayan comprado en e-market.
select max(cc.ClienteID), FechaFactura from clientes cc right join facturas ff on cc.ClienteID = ff.ClienteID group by cc.ClienteID;

-- 6. Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un
-- listado con todas las empresas de correo, y la cantidad de facturas
-- correspondientes. Realizar la consulta utilizando RIGHT JOIN.
select enviovia, count(*) from facturas ff right join correos cc on ff.EnvioVia = cc.CorreoID group by EnvioVia;

Clientes
1) ¿Cuántos clientes existen?
2) ¿Cuántos clientes hay por ciudad?

Facturas
1) ¿Cuál es el total de transporte?
2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.
4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado
realizó más operaciones de ventas?

Factura detalle
1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario.
3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?
4) ¿Cuál es el precio unitario promedio de cada producto?
5) ¿Cuál es el precio unitario máximo?

Clientes
1. Crear una vista con los siguientes datos de los clientes: ID, contacto, y el
Fax. En caso de que no tenga Fax, colocar el teléfono, pero aclarándolo. Por
ejemplo: “TEL: (01) 123-4567”.
2. Se necesita listar los números de teléfono de los clientes que no tengan
fax. Hacerlo de dos formas distintas:
a. Consultando la tabla de clientes.
b. Consultando la vista de clientes.
Proveedores

1. Crear una vista con los siguientes datos de los proveedores: ID,
contacto, compañía y dirección. Para la dirección tomar la dirección,
ciudad, código postal y país.
2. Listar los proveedores que vivan en la calle Americanas en Brasil. Hacerlo
de dos formas distintas:
a. Consultando la tabla de proveedores.
b. Consultando la vista de proveedores.
Vistas - Parte II
1. Crear una vista de productos que se usará para control de stock. Incluir el ID
y nombre del producto, el precio unitario redondeado sin decimales, las
unidades en stock y las unidades pedidas. Incluir además una nueva
columna PRIORIDAD con los siguientes valores:
■ BAJA: si las unidades pedidas son cero.
■ MEDIA: si las unidades pedidas son menores que las unidades
en stock.
■ URGENTE: si las unidades pedidas no duplican el número de
unidades.
■ SUPER URGENTE: si las unidades pedidas duplican el número
de unidades en caso contrario.
2. Se necesita un reporte de productos para identificar problemas de stock.
Para cada prioridad indicar cuántos productos hay y su precio promedio.
No incluir las prioridades para las que haya menos de 5 productos.