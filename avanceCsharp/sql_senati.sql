create database bd_ventas_ds504
go

use bd_ventas_ds504
go

create table tb_personal(
	dni char(8) not null primary key,
	ap_paterno varchar(25) not null,
	ap_materno varchar(25) not null,
	nombre varchar(25) not null,
	genero char(1),
	fecha_nacimiento date, 
	sueldo decimal(10, 2)
)
go
-- Crear tabla para la marca
CREATE TABLE tb_marca (
    codigo_marca CHAR(5) NOT NULL PRIMARY KEY,
    marca VARCHAR(30) NOT NULL
);

-- Crear tabla para la categoría
CREATE TABLE tb_categoria (
    codigo_categoria CHAR(5) NOT NULL PRIMARY KEY,
    categoria VARCHAR(30) NOT NULL
);

-- Crear tabla para el producto
CREATE TABLE tb_producto (
    codigo_producto CHAR(5) NOT NULL PRIMARY KEY,
    producto VARCHAR(40) NOT NULL,
    stock_disponible INT,
    costo decimal(10,2),
    ganancia decimal(10,2),
    producto_codigo_marca CHAR(5) NOT NULL,
    producto_codigo_categoria CHAR(5) NOT NULL,
    FOREIGN KEY (producto_codigo_marca) REFERENCES tb_marca (codigo_marca),
    FOREIGN KEY (producto_codigo_categoria) REFERENCES tb_categoria (codigo_categoria)
);

-- Crear tabla para el departamento
CREATE TABLE tb_departamento (
    codigo_departamento CHAR(5) NOT NULL PRIMARY KEY,
    departamento VARCHAR(25) NOT NULL
);

-- Crear tabla para la provincia
CREATE TABLE tb_provincia (
    codigo_provincia CHAR(5) NOT NULL PRIMARY KEY,
    provincia VARCHAR(50) NOT NULL,
    provincia_codigo_departamento CHAR(5) NOT NULL,
    FOREIGN KEY (provincia_codigo_departamento) REFERENCES tb_departamento (codigo_departamento)
);

-- Crear tabla para el distrito
CREATE TABLE tb_distrito (
    codigo_distrito CHAR(5) NOT NULL PRIMARY KEY,
    distrito VARCHAR(50) NOT NULL,
    distrito_codigo_provincia CHAR(5) NOT NULL,
    FOREIGN KEY (distrito_codigo_provincia) REFERENCES tb_provincia (codigo_provincia)
);

-- Crear tabla para el cliente
CREATE TABLE tb_cliente (
    codigo_cliente CHAR(5) NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    ap_paterno VARCHAR(20) NOT NULL,
    ap_materno VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE,
    direccion VARCHAR(50),
    correo_electronico VARCHAR(50),
    cliente_codigo_distrito CHAR(5) NOT NULL,
    FOREIGN KEY (cliente_codigo_distrito) REFERENCES tb_distrito (codigo_distrito)
);

-- Crear tabla para la venta
CREATE TABLE tb_venta (
    codigo_venta CHAR(5) NOT NULL PRIMARY KEY,
    fecha DATE,
    venta_codigo_cliente CHAR(5) NOT NULL,
    monto decimal(10,2),
    FOREIGN KEY (venta_codigo_cliente) REFERENCES tb_cliente (codigo_cliente)
);

-- Crear tabla para el detalle de venta
CREATE TABLE tb_detalle_venta (
    dv_codigo_venta CHAR(5) NOT NULL,
    dv_codigo_producto CHAR(5) NOT NULL,
    cantidad INT,
    costo decimal(10,2),
    FOREIGN KEY (dv_codigo_venta) REFERENCES tb_venta (codigo_venta),
    FOREIGN KEY (dv_codigo_producto) REFERENCES tb_producto (codigo_producto)
);

set dateformat 'dmy'
go

insert into tb_personal values
	('74716427', 'lopez', 'huari', 'luis', 'm', '27-05-2003', 1525.20),
	('47581453', 'ambrosio', 'guerra', 'jean', 'm', '02-08-2005', 1525.20),
	('45282453', 'munos', 'de la torre', 'rosa', 'f', '01-09-1993', 1525.20),
	('65754645', 'benedicto', 'jimenez', 'naomi', 'f', '21-05-1995', 1525.20),
	('42545876', 'zambrano', 'gonzales', 'jorge', 'm', '05-09-2002', 1525.20),
	('21235487', 'castillo', 'cruz', 'karely', 'f', '15-07-2001', 1525.20),
	('45632154', 'marrufo', 'torres', 'jordi', 'm', '27-11-2000', 1525.20)
go

-- Completar 5 registros para la tabla tb_marca
INSERT INTO tb_marca VALUES
('M0001', 'Sony'),
('M0002', 'LG'),
('M0003', 'Acer'),
('M0004', 'Samsung'),
('M0005', 'Lenovo');

-- Completar 5 registros para la tabla tb_categoria
INSERT INTO tb_categoria VALUES
('C0001', 'Electrodoméstico'),
('C0002', 'Equipo de cómputo'),
('C0003', 'Smartphone'),
('C0004', 'Audio'),
('C0005', 'TV y Video');

-- Completar 4 registros para la tabla tb_producto
INSERT INTO tb_producto VALUES
('P0001', 'Lavadora 13Kg', 100, 1420, 0.2, 'M0002', 'C0001'),
('P0002', 'Laptop Core i3 8GB SSD 250 GB', 54, 1762.45, 0.1635, 'M0003', 'C0002'),
('P0003', 'Samsung Galaxy A14', 80, 699.50, 0.1623, 'M0004', 'C0003'),
('P0004', 'Monitor Gamer Lenovo G24-20 Full HD 23.8" 144Hz', 25, 999.45, 0.1852, 'M0005', 'C0005');

-- Completar 10 registros para la tabla tb_departamento
INSERT INTO tb_departamento VALUES
('DP001','Lima'),
('DP002','Arequipa'),
('DP003','Ica'),
('DP004','Cajamarca'),
('DP005','Lambayeque'),
('DP006','Piura'),
('DP007','Loreto'),
('DP008','Cuzco'),
('DP009','Tacna'),
('DP010','Moquegua');

-- Completar 15 registros para la tabla tb_provincia
INSERT INTO tb_provincia VALUES
('PR001','Lima', 'DP001'),
('PR002','Callao', 'DP001'),
('PR003','Huaral', 'DP001'),
('PR004','Cañete', 'DP001'),
('PR005','Arequipa', 'DP002'),
('PR006','Camaná', 'DP002'),
('PR007','Ica', 'DP003'),
('PR008','Chincha', 'DP003'),
('PR009','Pisco', 'DP003'),
('PR010','Sullana', 'DP006'),
('PR011','Calca', 'DP008'),
('PR012','Tarata', 'DP009'),
('PR013','Talara', 'DP006'),
('PR014','Mariscal Nieto', 'DP010'),
('PR015','Ilo', 'DP010');

-- Completar 12 registros para la tabla tb_distrito
INSERT INTO tb_distrito VALUES
('D0001','Lima', 'PR001'),
('D0002','Callao', 'PR002'),
('D0003','San Martín de Porres', 'PR001'),
('D0004','Los Olivos', 'PR001'),
('D0005','Arequipa', 'PR005'),
('D0006','Cayma', 'PR005'),
('D0007','Ica', 'PR007'),
('D0008','Marcavelica', 'PR010'),
('D0009','Lancones', 'PR010'),
('D0010','Carumas', 'PR014'),
('D0011','San Cristóbal de Calacoa', 'PR014'),
('D0012','Pacocha', 'PR015');

-- Completar 5 registros para la tabla tb_cliente
INSERT INTO tb_cliente VALUES
('C0001', 'Carlos', 'Ramos', 'Vera', '1999-04-12', 'Av. Sauces 253', 'carlos.ramos258@gmail.com', 'D0003'),
('C0002', 'Rosa', 'Collantes', 'Flores', '2000-05-31', 'Jr. Álamos 354', NULL, 'D0001'),
('C0003', 'Felipe', 'Montes', 'Salas', '2001-09-22', 'Av. Flores 2541', 'fmontes.salas@gmail.com', 'D0003'),
('C0004', 'Viviana', 'Gonzáles', 'Roca', '2000-07-17', 'Calle Lomas 251', 'viviana.gr20@gmail.com', 'D0006'),
('C0005', 'Luis', 'Lopez', 'Huari', '2003-05-27', 'Av. 12 de Otubre', 'luislopezhuari27@gmail.com', 'D0001');

-- Insertar registros de ventas
INSERT INTO tb_venta VALUES
('V0001', '2024-04-01', 'C0001', 1000.50),
('V0002', '2024-04-02', 'C0002', 2000.75),
('V0003', '2024-04-03', 'C0003', 1500.25),
('V0004', '2024-04-04', 'C0004', 3000.00),
('V0005', '2024-04-05', 'C0005', 2500.75);