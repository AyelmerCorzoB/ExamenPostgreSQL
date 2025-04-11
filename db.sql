CREATE DATABASE techzone;

\c techzone

CREATE TABLE paises(
    id serial PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE regiones(
    id serial NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    idpais_fk integer NOT NULL REFERENCES paises(id)
);

CREATE TABLE ciudades(
    id serial NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    id_regionfk integer NOT NULL REFERENCES regiones(id)
);

CREATE TABLE proveedores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    correo_electronico VARCHAR(255),
    telefono BIGINT NOT NULL UNIQUE,
    id_ciudad_fk INTEGER NOT NULL REFERENCES ciudades(id)
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(255) NOT NULL,
    telefono BIGINT NOT NULL,
    id_ciudad_fk INTEGER NOT NULL REFERENCES ciudades(id)
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    stock INTEGER NOT NULL CHECK (stock >= 0),
    stock_min INTEGER,
    stock_max INTEGER,
    price DOUBLE PRECISION NOT NULL CHECK (price > 0),
    id_proveedor_fk INTEGER NOT NULL REFERENCES proveedores(id),
    id_categoria_fk INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TYPE tipo_pago_enum AS ENUM ('efectivo', 'transferencia');

CREATE TABLE tipos_de_pago (
    id SERIAL PRIMARY KEY,
    tipo tipo_pago_enum NOT NULL
);

CREATE TABLE compras (
    id SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL REFERENCES clientes(id),
    id_tipo_pago INTEGER NOT NULL REFERENCES tipos_de_pago(id),
    order_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE detalle_compra (
    id SERIAL PRIMARY KEY,
    id_compra_fk INTEGER NOT NULL REFERENCES compras(id),
    id_producto INTEGER NOT NULL REFERENCES productos(id),
    cantidad SMALLINT NOT NULL CHECK (cantidad > 0),
    precio DOUBLE PRECISION NOT NULL CHECK (precio > 0)
);

CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    id_producto INTEGER NOT NULL REFERENCES productos(id),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    id_cliente INTEGER NOT NULL REFERENCES clientes(id),
    fecha DATE DEFAULT CURRENT_DATE
);
