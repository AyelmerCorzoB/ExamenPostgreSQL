# EXAMEN POSTGREE TechZone

Esta implementacion ayuda a un negocio dedicado a la venta de productos tecnológicos, desde laptops y teléfonos hasta accesorios y componentes electrónicos. Con el crecimiento del comercio digital y la alta demanda de dispositivos electrónicos, la empresa ha notado la necesidad de mejorar la gestión de su inventario y ventas

## Características principales

- Registro y control de **productos** por proveedor y categoría.
- Seguimiento de **stock mínimo y máximo**.
- Registro de **clientes, compras y ventas**.
- Registro de **proveedores** y su ubicación geográfica.
- Control automático del **stock al momento de realizar ventas**.
- Consultas analíticas para:
  - Identificar productos con bajo stock.
  - Obtener productos más vendidos.
  - Clientes con más compras.
  - Clientes inactivos.
  - Ventas por mes o por rango de fechas.
- Procedimientos y funciones para:
  - Registrar ventas.
  - Validar clientes.
  - Verificar disponibilidad de stock antes de una venta.

## Estructura de la base de datos

La base de datos se llama `techzone` y contiene las siguientes tablas principales:

- `paises`, `regiones`, `ciudades`
- `proveedores`, `clientes`
- `categoria`, `productos`
- `tipos_de_pago`, `compras`, `detalle_compra`
- `ventas`
- Procedimientos y funciones en PL/pgSQL para registrar ventas y validar clientes.

## Imagen del modelo E-R

![modelo_er](https://github.com/user-attachments/assets/237ff389-f066-43e5-9953-c1ce536bccdb)

## Cómo utilizar

1. Crear la base de datos:

```sql
CREATE DATABASE techzone;
\c techzone
```

2. Ejecutar los scripts SQL de creación de tablas e inserción de datos (ver archivos `.sql` o contenido en este repositorio).

3. Utilizar las consultas para generar reportes y análisis.

4. Ejecutar funciones o procedimientos almacenados para registrar ventas y mantener el control del inventario.

## Consultas útiles

- Productos con stock bajo.
- Productos más vendidos.
- Clientes más frecuentes.
- Ventas por mes o fecha.
- Clientes inactivos.

## Mantenimiento de stock

Cada vez que se registra una venta, el stock del producto se actualiza automáticamente. Si no hay suficiente stock, se lanza una excepción.

## Autor

Ayelmer Corzo

---
