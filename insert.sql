INSERT INTO paises (nombre) VALUES 
('México'),
('Argentina'),
('Chile'),
('Colombia'),
('Perú');

INSERT INTO regiones (nombre, idpais_fk) VALUES 
('Ciudad de México', 1),
('Buenos Aires', 2),
('Santiago', 3),
('Antioquia', 4),
('Lima Metropolitana', 5);

INSERT INTO ciudades (nombre, id_regionfk) VALUES 
('Duitama', 1),
('Buenos Aires', 2),
('Santiago Centro', 3),
('Medellín', 4),
('Lima', 5);


INSERT INTO proveedores (nombre, correo_electronico, telefono, id_ciudad_fk) VALUES 
('provedor1', 'example@mail.com', 1111111111, 1),
('provedor2', 'example@mail.com', 2222222222, 2),
('provedor3', 'example@mail.com', 3333333333, 3),
('provedor4', 'example@mail.com', 4444444444, 4),
('provedor5', 'example@mail.com', 5555555555, 5),
('provedor6', 'example@mail.com', 6666666666, 1),
('provedor7', 'example@mail.com', 7777777777, 2),
('provedor8', 'example@mail.com', 8888888888, 3),
('provedor9', 'example@mail.com', 9999999999, 4),
('provedor10', 'example@mail.com', 1010101010, 5),
('provedor11', 'example@mail.com', 1112223334, 1),
('provedor12', 'example@mail.com', 1212121212, 2),
('provedor13', 'example@mail.com', 1313131313, 3),
('provedor14', 'example@mail.com', 1414141414, 4),
('provedor15', 'example@mail.com', 1515151515, 5);

INSERT INTO clientes (nombre, correo_electronico, telefono, id_ciudad_fk) VALUES 
('cliente1', 'example@mail.com', 3011111111, 1),
('cliente2', 'example@mail.com', 3011111112, 2),
('cliente3', 'example@mail.com', 3011111113, 3),
('cliente4', 'example@mail.com', 3011111114, 4),
('cliente5', 'example@mail.com', 3011111115, 5),
('cliente6', 'example@mail.com', 3011111116, 1),
('cliente7', 'example@mail.com', 3011111117, 2),
('cliente8', 'example@mail.com', 3011111118, 3),
('cliente9', 'example@mail.com', 3011111119, 4),
('cliente10', 'example@mail.com', 3011111120,5),
('cliente11', 'example@mail.com', 3011111121,1),
('cliente12', 'example@mail.com', 3011111122,2),
('cliente13', 'example@mail.com', 3011111123,3),
('cliente14', 'example@mail.com', 3011111124, 4),
('cliente15', 'example@mail.com', 3011111125, 5),
('AyelmerCorzo', 'example@mail.com', 3011111126, 4);

INSERT INTO categoria (nombre) VALUES 
('Categoria 1'),
('Categoria 2'),
('Categoria 3'),
('Categoria 4'),
('Categoria 5'),
('Categoria 6'),
('Categoria 7'),
('Categoria 8'),
('Categoria 9'),
('Categoria 10'),
('Categoria 11'),
('Categoria 12'),
('Categoria 13'),
('Categoria 14'),
('Categoria 15');

INSERT INTO productos (nombre, descripcion, stock, stock_min, stock_max, price, id_proveedor_fk, id_categoria_fk) VALUES 
('Producto 1', 'Descripcion 1', 50, 10, 100, 1200.00, 1, 1),
('Producto 2', 'Descripcion 2', 30, 5, 80, 999.00, 2, 2),
('Producto 3', 'Descripcion 3', 25, 5, 60, 850.00, 3, 3),
('Producto 4', 'Descripcion 4', 40, 5, 70, 550.00, 4, 4),
('Producto 5', 'Descripcion 5', 100, 20, 200, 99.99, 5, 5),
('Producto 6', 'Descripcion 6', 45, 10, 100, 180.00, 6, 6),
('Producto 7', 'Descripcion 7', 200, 50, 500, 69.99, 7, 7),
('Producto 8', 'Descripcion 8', 2, 2, 30, 499.99, 8, 8),
('Producto 9', 'Descripcion 9', 35, 5, 50, 650.00, 9, 9),
('Producto 10', 'Descripcion 10', 80, 10, 150, 120.00, 10, 10),
('Producto 11', 'Descripcion 11', 25, 5, 40, 300.00, 11, 11),
('Producto 12', 'Descripcion 12', 60, 10, 120, 99.00, 12, 12),
('Producto 13', 'Descripcion 13', 4, 4, 35, 580.00, 13, 13),
('Producto 14', 'Descripcion 14', 70, 10, 140, 129.00, 14, 14),
('Producto 15', 'Descripcion 15', 3, 15, 150, 150.00, 15, 15);


INSERT INTO tipos_de_pago (tipo) VALUES 
('efectivo'),
('transferencia');

INSERT INTO compras (id_cliente, id_tipo_pago, order_date) VALUES 
(1, 1, '2024-10-10'),
(2, 2, '2024-11-15'),
(3, 1, '2024-12-01'),
(4, 2, '2024-12-05'),
(5, 1, '2024-12-06'),
(6, 1, '2024-12-07'),
(7, 2, '2024-12-08'),
(8, 1, '2025-01-20'),
(9, 2, '2025-02-14'),
(10, 1, '2025-02-15'),
(11, 2, '2025-03-10'),
(12, 1, '2025-03-12'),
(13, 2, '2025-03-15'),
(14, 1, '2025-04-08'),
(15, 2, '2025-04-10');

INSERT INTO detalle_compra (id_compra_fk, id_producto, cantidad, precio) VALUES 
(1, 1, 2, 1200.00),
(2, 2, 1, 999.00),
(3, 3, 3, 850.00),
(4, 4, 1, 550.00),
(5, 5, 2, 99.99),
(6, 6, 1, 180.00),
(7, 7, 5, 69.99),
(8, 8, 1, 499.99),
(9, 9, 1, 650.00),
(10, 10, 2, 120.00),
(11, 11, 1, 300.00),
(12, 12, 2, 99.00),
(13, 13, 1, 580.00),
(14, 14, 2, 129.00),
(15, 15, 1, 150.00);

INSERT INTO ventas (id_producto, cantidad, id_cliente) VALUES 
(1, 1, 1), (2, 1, 2), (3, 1, 3), (4, 2, 4), (5, 3, 5),
(6, 1, 6), (7, 2, 7), (8, 1, 8), (9, 1, 9), (10, 2, 10),
(11, 1, 11), (12, 2, 12), (13, 1, 13), (14, 2, 14), (15, 1, 15);
INSERT INTO ventas (id_producto, cantidad, id_cliente,fecha) VALUES
(1, 1, 1,'2025-04-10');