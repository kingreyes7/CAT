-- Crear tabla de flujo proyectado
CREATE TABLE flujo_proyectado (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  mes VARCHAR2(20),
  monto NUMBER(10,2),
  tipo VARCHAR2(10) -- 'VENTA' o 'COMPRA'
);

-- Crear tabla de ventas
CREATE TABLE ventas (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  fecha DATE,
  total NUMBER(10,2)
);

-- Crear tabla de compras
CREATE TABLE compras (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  fecha DATE,
  total NUMBER(10,2)
);

-- Insertar datos en flujo proyectado
INSERT INTO flujo_proyectado (mes, monto, tipo) VALUES ('Enero', 12000, 'VENTA');
INSERT INTO flujo_proyectado (mes, monto, tipo) VALUES ('Enero', 6000, 'COMPRA');
INSERT INTO flujo_proyectado (mes, monto, tipo) VALUES ('Febrero', 14000, 'VENTA');
INSERT INTO flujo_proyectado (mes, monto, tipo) VALUES ('Febrero', 7000, 'COMPRA');

-- Insertar ventas reales
INSERT INTO ventas (fecha, total) VALUES (TO_DATE('2025-01-15', 'YYYY-MM-DD'), 11500);
INSERT INTO ventas (fecha, total) VALUES (TO_DATE('2025-02-18', 'YYYY-MM-DD'), 13000);

-- Insertar compras reales
INSERT INTO compras (fecha, total) VALUES (TO_DATE('2025-01-10', 'YYYY-MM-DD'), 5500);
INSERT INTO compras (fecha, total) VALUES (TO_DATE('2025-02-20', 'YYYY-MM-DD'), 7200);

COMMIT;
