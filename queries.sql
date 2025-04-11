-- 1️⃣ Listar los productos con stock menor a 5 unidades.
SELECT id, nombre, stock
FROM productos
WHERE stock < 5;

-- 2️⃣ Calcular ventas totales de un mes específico
SELECT DATE_TRUNC('month', fecha) AS mes,
SUM(p.price * v.cantidad) AS total_ventas
FROM ventas v
JOIN productos p ON v.id_producto = p.id
WHERE fecha = '2025-04-10'
GROUP BY mes;

-- 3️⃣ Obtener el cliente con más compras realizadas.
SELECT cL.id, cL.nombre, COUNT(c.id) AS total_compras
FROM clientes cL
JOIN compras C ON c.id = c.id_cliente
GROUP BY cL.id
ORDER BY total_compras DESC
LIMIT 1;

-- 4️⃣ Listar los 5 productos más vendidos.
SELECT p.nombre AS producto,
SUM(v.cantidad) AS total_vendido
FROM ventas v
JOIN productos p ON v.id_producto = p.id
GROUP BY p.nombre
ORDER BY total_vendido DESC
LIMIT 5;

-- 5️⃣ Consultar ventas realizadas en un rango de fechas de tres Días y un Mes.
SELECT v.id,p.nombre AS producto,v.cantidad,c.nombre AS cliente,v.fecha
FROM ventas v
JOIN productos p ON v.id_producto = p.id
JOIN clientes c ON v.id_cliente = c.id
WHERE DATE_TRUNC('month', v.fecha) = DATE '2025-04-01';

-- 6️⃣ Identificar clientes que no han comprado en los últimos 6 meses.
SELECT nombre
FROM clientes
WHERE id NOT IN (SELECT id_cliente FROM ventas
    WHERE fecha >= CURRENT_DATE - INTERVAL '6 months'
);