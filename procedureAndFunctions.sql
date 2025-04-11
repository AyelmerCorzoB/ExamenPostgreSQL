-- Un procedimiento almacenado para registrar una venta.
CREATE OR REPLACE PROCEDURE registrar_ventas(
    p_id_producto INT,
    p_cantidad INT, 
    p_id_cliente INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO ventas (id_producto, cantidad, id_cliente) 
    VALUES (p_id_producto, p_cantidad, p_id_cliente);
    
    RAISE NOTICE 'registrado con exito';
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE 'Error: %',SQLERRM;
END;
$$;

-- Prueba
CREATE OR REPLACE FUNCTION validar_cliente(cliente_id INT) RETURNS TEXT AS $$
DECLARE
  existe BOOLEAN;
  nombre_cliente TEXT;
BEGIN
  SELECT TRUE, nombre INTO existe, nombre_cliente
  FROM clientes
  WHERE id = cliente_id
  LIMIT 1;

  IF existe THEN
    RETURN FORMAT('El cliente SÍ existe y es: %s', nombre_cliente);
  ELSE
    RETURN 'El cliente NO existe';
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'El cliente NO existe';
END;
$$ LANGUAGE plpgsql;

-- Prueba
SELECT validar_cliente(16); 

-- Verificar que el stock sea suficiente antes de procesar la venta.
CREATE OR REPLACE FUNCTION hacer_venta(
    id_producto INTEGER,
    cantidad_vendida INTEGER,
    id_cliente INTEGER
)
RETURNS VOID AS $$
DECLARE
    stock_actual INTEGER;
BEGIN
    SELECT stock INTO stock_actual
    FROM productos
    WHERE id = id_producto;

    IF stock_actual IS NULL THEN
        RAISE EXCEPTION 'El producto no existe.';
    END IF;

    IF stock_actual < cantidad_vendida THEN
        RAISE EXCEPTION 'No hay suficiente stock. Disponible: %, solicitado: %', stock_actual, cantidad_vendida;
    END IF;

    INSERT INTO ventas (id_producto, cantidad, id_cliente)
    VALUES (id_producto, cantidad_vendida, id_cliente);

    UPDATE productos
    SET stock = stock - cantidad_vendida
    WHERE id = id_producto;
END;
$$ LANGUAGE plpgsql;


-- Prueba
SELECT hacer_venta(1, 5, 2);

-- Si no hay stock suficiente, Notificar por medio de un mensaje en consola usando RAISE.
CREATE OR REPLACE FUNCTION registrar_venta(
    producto_id INTEGER,
    cantidad_p INTEGER,
    cliente_id INTEGER
) RETURNS VOID AS $$
DECLARE
    stock_actual INTEGER;
BEGIN
    SELECT stock INTO stock_actual
    FROM productos
    WHERE id = producto_id;

    IF stock_actual IS NULL THEN
        RAISE EXCEPTION 'Producto con ID % no existe.', producto_id;
    ELSIF stock_actual < cantidad_p THEN
        RAISE EXCEPTION 'Stock insuficiente para el producto con ID % (stock actual: %, solicitado: %).', 
                        producto_id, stock_actual, cantidad_p;
    ELSE
        INSERT INTO ventas(id_producto, cantidad, id_cliente)
        VALUES (producto_id, cantidad_p, cliente_id);

        UPDATE productos
        SET stock = stock - cantidad_p
        WHERE id = producto_id;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- pueba
SELECT registrar_venta(1, 5, 2);
SELECT registrar_venta(1, 1000, 2);

-- Si hay stock, se realiza el registro de la venta.
