--------------------------------------------------------
--  File created - Wednesday-March-20-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ALIMENTOS
--------------------------------------------------------

  CREATE TABLE "ALIMENTOS" 
   (	"ALIMENTO_ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(200 BYTE), 
	"STOCK" NUMBER(*,0), 
	"PRECIO" NUMBER(10,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CITAS
--------------------------------------------------------

  CREATE TABLE "CITAS" 
   (	"CITA_ID" NUMBER(*,0), 
	"CLIENTE_ID" NUMBER(*,0), 
	"MASCOTA_ID" NUMBER(*,0), 
	"FECHA" DATE, 
	"MOTIVO" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENTES
--------------------------------------------------------

  CREATE TABLE "CLIENTES" 
   (	"CLIENTE_ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"APELLIDO" VARCHAR2(100 BYTE), 
	"DIRECCION" VARCHAR2(100 BYTE), 
	"TELEFONO" VARCHAR2(20 BYTE), 
	"CORREO" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HISTORIAL
--------------------------------------------------------

  CREATE TABLE "HISTORIAL" 
   (	"HISTORIAL_ID" NUMBER(*,0), 
	"MASCOTA_ID" NUMBER(*,0), 
	"FECHA" DATE, 
	"DESCRIPCION" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table INVENTARIO
--------------------------------------------------------

  CREATE TABLE "INVENTARIO" 
   (	"INVENTARIO_ID" NUMBER(*,0), 
	"NOMBRE_PRODUCTO" VARCHAR2(100 BYTE), 
	"PRECIO_PRODUCTO" NUMBER(10,2), 
	"MEDICAMENTO_ID" NUMBER(*,0), 
	"JUGUETE_ID" NUMBER(*,0), 
	"ALIMENTO_ID" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JUGUETES
--------------------------------------------------------

  CREATE TABLE "JUGUETES" 
   (	"JUGUETE_ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(200 BYTE), 
	"PRECIO" NUMBER(10,2), 
	"STOCK" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MASCOTAS
--------------------------------------------------------

  CREATE TABLE "MASCOTAS" 
   (	"MASCOTA_ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"ESPECIE" VARCHAR2(100 BYTE), 
	"EDAD" NUMBER(*,0), 
	"CLIENTE_ID" NUMBER(*,0), 
	"RAZA" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEDICAMENTOS
--------------------------------------------------------

  CREATE TABLE "MEDICAMENTOS" 
   (	"MEDICAMENTO_ID" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(200 BYTE), 
	"STOCK" NUMBER(*,0), 
	"PRECIO" NUMBER(10,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View VISTA_CITAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "VISTA_CITAS" ("CITA_ID", "CLIENTE_ID", "NOMBRE_CLIENTE", "MASCOTA_ID", "NOMBRE_MASCOTA", "FECHA", "MOTIVO") AS 
  SELECT c.Cita_id, c.Cliente_id, cli.Nombre AS Nombre_cliente, c.Mascota_id, m.Nombre AS Nombre_mascota, c.Fecha, c.Motivo
FROM Citas c
JOIN Clientes cli ON c.Cliente_id = cli.Cliente_id
JOIN Mascotas m ON c.Mascota_id = m.Mascota_id
;
--------------------------------------------------------
--  DDL for View VISTA_CITAS_PENDIENTES
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "VISTA_CITAS_PENDIENTES" ("CITA_ID", "NOMBRE_CLIENTE", "NOMBRE_MASCOTA", "FECHA", "MOTIVO") AS 
  SELECT ci.Cita_id, cl.Nombre AS Nombre_Cliente, m.Nombre AS Nombre_Mascota, ci.Fecha, ci.Motivo
FROM Citas ci
JOIN Clientes cl ON ci.Cliente_id = cl.Cliente_id
JOIN Mascotas m ON ci.Mascota_id = m.Mascota_id
WHERE ci.Fecha > CURRENT_DATE
;
--------------------------------------------------------
--  DDL for View VISTA_CLIENTES
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "VISTA_CLIENTES" ("CLIENTE_ID", "NOMBRE", "APELLIDO", "DIRECCION", "TELEFONO", "CORREO") AS 
  SELECT Cliente_id, Nombre, Apellido, Direccion, Telefono, Correo
FROM Clientes
;
--------------------------------------------------------
--  DDL for View VISTA_CLIENTES_MASCOTAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "VISTA_CLIENTES_MASCOTAS" ("CLIENTE_ID", "NOMBRE_CLIENTE", "APELLIDO", "MASCOTA_ID", "NOMBRE_MASCOTA", "ESPECIE", "EDAD") AS 
  SELECT c.Cliente_id, c.Nombre AS Nombre_Cliente, c.Apellido, m.Mascota_id, m.Nombre AS Nombre_Mascota, m.Especie, m.Edad
FROM Clientes c
JOIN Mascotas m ON c.Cliente_id = m.Cliente_id
;
--------------------------------------------------------
--  DDL for View VISTA_STOCK_PRODUCTOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "VISTA_STOCK_PRODUCTOS" ("TIPO_PRODUCTO", "NOMBRE_PRODUCTO", "STOCK") AS 
  SELECT 'Medicamento' AS Tipo_Producto, Nombre AS Nombre_Producto, Stock
FROM Medicamentos
UNION ALL
SELECT 'Juguete' AS Tipo_Producto, Nombre AS Nombre_Producto, Stock
FROM Juguetes
UNION ALL
SELECT 'Alimento' AS Tipo_Producto, Nombre AS Nombre_Producto, Stock
FROM Alimentos
;
REM INSERTING into ALIMENTOS
SET DEFINE OFF;
REM INSERTING into CITAS
SET DEFINE OFF;
REM INSERTING into CLIENTES
SET DEFINE OFF;
REM INSERTING into HISTORIAL
SET DEFINE OFF;
REM INSERTING into INVENTARIO
SET DEFINE OFF;
REM INSERTING into JUGUETES
SET DEFINE OFF;
REM INSERTING into MASCOTAS
SET DEFINE OFF;
REM INSERTING into MEDICAMENTOS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C007505
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007505" ON "CLIENTES" ("CLIENTE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007506
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007506" ON "MEDICAMENTOS" ("MEDICAMENTO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007507
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007507" ON "JUGUETES" ("JUGUETE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007508
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007508" ON "ALIMENTOS" ("ALIMENTO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007509
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007509" ON "MASCOTAS" ("MASCOTA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007511
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007511" ON "CITAS" ("CITA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007514
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007514" ON "HISTORIAL" ("HISTORIAL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007516
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007516" ON "INVENTARIO" ("INVENTARIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007508
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007508" ON "ALIMENTOS" ("ALIMENTO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007511
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007511" ON "CITAS" ("CITA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007505
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007505" ON "CLIENTES" ("CLIENTE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007514
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007514" ON "HISTORIAL" ("HISTORIAL_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007516
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007516" ON "INVENTARIO" ("INVENTARIO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007507
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007507" ON "JUGUETES" ("JUGUETE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007509
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007509" ON "MASCOTAS" ("MASCOTA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007506
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007506" ON "MEDICAMENTOS" ("MEDICAMENTO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure ACTUALIZARCLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ACTUALIZARCLIENTE" (
    p_cliente_id INT,
    p_Nombre VARCHAR2,
    p_apellido VARCHAR2,
    p_direccion varchar2,
    p_telefono INT,
    p_correo varchar2
)
AS
BEGIN
    UPDATE clientes 
    SET Nombre = p_Nombre, apellido = p_apellido, direccion = p_direccion, telefono = p_telefono, correo = p_correo 
    WHERE cliente_id = p_cliente_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZARJUGUETE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ACTUALIZARJUGUETE" (
    p_Juguete_id INT,
    p_Nombre VARCHAR2,
    p_descripcion VARCHAR2,
    p_stock INT,
    p_precio INT
)
AS
BEGIN
    UPDATE Juguetes 
    SET Nombre = p_Nombre, descripcion = p_descripcion, stock = p_stock, precio = p_precio 
    WHERE juguete_id = p_Juguete_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZARMASCOTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ACTUALIZARMASCOTA" (
    p_Mascota_id INT,
    p_Nombre VARCHAR2,
    p_Especie VARCHAR2,
    p_Edad INT,
    p_Cliente_id INT,
    p_Raza VARCHAR2
)
AS
BEGIN
    UPDATE Mascotas 
    SET Nombre = p_Nombre, Especie = p_Especie, Edad = p_Edad, Cliente_id = p_Cliente_id, Raza = p_Raza 
    WHERE Mascota_id = p_Mascota_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure ACTUALIZARMEDICAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ACTUALIZARMEDICAMENTO" (
    p_Medicamento_id INT,
    p_Nombre VARCHAR2,
    p_Descripcion VARCHAR2,
    p_Stock INT,
    p_Precio INT
)
AS
BEGIN
    UPDATE medicamentos 
    SET Nombre = p_Nombre, descripcion = p_Descripcion, stock = p_Stock, precio = p_Precio 
    WHERE medicamento_id = p_Medicamento_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure ELIMINARCLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ELIMINARCLIENTE" (
    p_Cliente_id INT
)
AS
BEGIN
    DELETE FROM Clientes WHERE cliente_id = p_Cliente_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure ELIMINARJUGUETE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ELIMINARJUGUETE" (
    p_Juguete_id INT
)
AS
BEGIN
    DELETE FROM Juguetes WHERE juguete_id = p_Juguete_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure ELIMINARMASCOTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ELIMINARMASCOTA" (
    p_Mascota_id INT
)
AS
BEGIN
    DELETE FROM Mascotas WHERE Mascota_id = p_Mascota_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure ELIMINARMEDICAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "ELIMINARMEDICAMENTO" (
    p_medicamento_id INT
)
AS
BEGIN
    DELETE FROM medicamentos WHERE medicamento_id = p_medicamento_id;
END;

/
--------------------------------------------------------
--  DDL for Procedure HISTORIALMEDICOMASCOTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "HISTORIALMEDICOMASCOTA" (
    p_mascota_id IN NUMBER
)
IS
    CURSOR c_historial IS
        SELECT Historial.Historial_id, Historial.Fecha, Historial.Descripcion
        FROM Historial
        WHERE Historial.Mascota_id = p_mascota_id
        ORDER BY Historial.Fecha DESC;

    r_historial c_historial%ROWTYPE;
BEGIN
    OPEN c_historial;
    LOOP
        FETCH c_historial INTO r_historial;
        EXIT WHEN c_historial%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Historial ID: ' || r_historial.Historial_id);
        DBMS_OUTPUT.PUT_LINE('Fecha: ' || r_historial.Fecha);
        DBMS_OUTPUT.PUT_LINE('Descripción: ' || r_historial.Descripcion);
        DBMS_OUTPUT.PUT_LINE('-------------------');
    END LOOP;
    CLOSE c_historial;
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERTARCLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "INSERTARCLIENTE" (
    p_Nombre VARCHAR2,
    p_Apellido VARCHAR2,
    p_Direccion varchar2,
    p_Telefono INT,
    p_Correo varchar2
)
AS
BEGIN
    INSERT INTO clientes (cliente_id, nombre, apellido, direccion, telefono, correo) 
    VALUES ((SELECT COALESCE(MAX(cliente_id), 0) + 1 FROM clientes), p_Nombre, p_Apellido, p_Direccion, p_Telefono, p_Correo);
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERTARJUGUETE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "INSERTARJUGUETE" (
    p_Nombre VARCHAR2,
    p_Descripcion VARCHAR2,
    p_Stock INT,
    p_Precio INT
)
AS
BEGIN
    INSERT INTO Juguetes (juguete_id, nombre, descripcion, precio, stock) 
    VALUES ((SELECT COALESCE(MAX(juguete_id), 0) + 1 FROM Juguetes), p_Nombre, p_Descripcion, p_Stock, p_Precio);
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERTARMASCOTA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "INSERTARMASCOTA" (
    p_Nombre VARCHAR2,
    p_Especie VARCHAR2,
    p_Edad INT,
    p_Cliente_id INT,
    p_Raza VARCHAR2
)
AS
BEGIN
    INSERT INTO Mascotas (Mascota_id ,Nombre, Especie, Edad, Cliente_id, Raza) 
    VALUES ((SELECT COALESCE(MAX(mascota_id), 0) + 1 FROM mascotas), p_Nombre, p_Especie, p_Edad, p_Cliente_id, p_Raza);
END;

/
--------------------------------------------------------
--  DDL for Procedure INSERTARMEDICAMENTO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "INSERTARMEDICAMENTO" (
    p_Nombre VARCHAR2,
    p_Descripcion VARCHAR2,
    p_Stock INT,
    p_Precio INT
)
AS
BEGIN
    INSERT INTO Medicamentos (medicamento_id ,nombre, descripcion, stock, precio) 
    VALUES ((SELECT COALESCE(MAX(medicamento_id), 0) + 1 FROM medicamentos), p_Nombre, p_Descripcion, p_Stock, p_Precio);
END;

/
--------------------------------------------------------
--  DDL for Procedure LISTARMASCOTASPORCLIENTE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "LISTARMASCOTASPORCLIENTE" (
    p_cliente_id IN NUMBER
)
IS
    CURSOR c_mascotas IS
        SELECT Mascotas.Mascota_id, Mascotas.Nombre, Mascotas.Especie, Mascotas.Edad, Mascotas.Raza
        FROM Mascotas
        WHERE Mascotas.Cliente_id = p_cliente_id;

    r_mascota c_mascotas%ROWTYPE;
BEGIN
    OPEN c_mascotas;
    LOOP
        FETCH c_mascotas INTO r_mascota;
        EXIT WHEN c_mascotas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Mascota ID: ' || r_mascota.Mascota_id);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || r_mascota.Nombre);
        DBMS_OUTPUT.PUT_LINE('Especie: ' || r_mascota.Especie);
        DBMS_OUTPUT.PUT_LINE('Edad: ' || r_mascota.Edad);
        DBMS_OUTPUT.PUT_LINE('Raza: ' || r_mascota.Raza);
        DBMS_OUTPUT.PUT_LINE('-------------------');
    END LOOP;
    CLOSE c_mascotas;
END;

/
--------------------------------------------------------
--  DDL for Procedure OBTENERCLIENTES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "OBTENERCLIENTES" 
AS
BEGIN
    FOR cliente IN (SELECT * FROM Clientes) LOOP
        DBMS_OUTPUT.PUT_LINE(cliente.cliente_id || ', ' || cliente.Nombre || ', ' || cliente.apellido || ', ' || cliente.direccion || ', ' || cliente.telefono || ', ' || cliente.correo);
    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure OBTENERJUGUETES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "OBTENERJUGUETES" 
AS
BEGIN
    FOR Juguete IN (SELECT * FROM Juguetes) LOOP
        DBMS_OUTPUT.PUT_LINE(Juguete.Juguete_id || ', ' || Juguete.Nombre || ', ' || Juguete.descripcion || ', ' || Juguete.stock || ', ' || Juguete.precio);
    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure OBTENERMASCOTAS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "OBTENERMASCOTAS" 
AS
BEGIN
    FOR mascota IN (SELECT * FROM Mascotas) LOOP
        DBMS_OUTPUT.PUT_LINE(mascota.Mascota_id || ', ' || mascota.Nombre || ', ' || mascota.Especie || ', ' || mascota.Edad || ', ' || mascota.Cliente_id || ', ' || mascota.Raza);
    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure OBTENERMEDICAMENTOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "OBTENERMEDICAMENTOS" 
AS
BEGIN
    FOR medicamento IN (SELECT * FROM medicamentos) LOOP
        DBMS_OUTPUT.PUT_LINE(medicamento.Medicamento_id || ', ' || medicamento.Nombre || ', ' || medicamento.descripcion || ', ' || medicamento.stock || ', ' || medicamento.precio );
    END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure PRODUCTOSBAJOSTOCK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PRODUCTOSBAJOSTOCK" 
IS
    CURSOR c_productos IS
        SELECT i.Nombre_producto, i.Precio_producto,
               CASE
                   WHEN i.Medicamento_id IS NOT NULL THEN 'Medicamento'
                   WHEN i.Juguete_id IS NOT NULL THEN 'Juguete'
                   WHEN i.Alimento_id IS NOT NULL THEN 'Alimento'
               END AS Tipo_producto,
               COALESCE(m.Stock, j.Stock, a.Stock) AS Stock
        FROM Inventario i
        LEFT JOIN Medicamentos m ON i.Medicamento_id = m.Medicamento_id
        LEFT JOIN Juguetes j ON i.Juguete_id = j.Juguete_id
        LEFT JOIN Alimentos a ON i.Alimento_id = a.Alimento_id
        WHERE COALESCE(m.Stock, j.Stock, a.Stock) < 10;

    r_producto c_productos%ROWTYPE;
BEGIN
    OPEN c_productos;
    LOOP
        FETCH c_productos INTO r_producto;
        EXIT WHEN c_productos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || r_producto.Nombre_producto);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || r_producto.Precio_producto);
        DBMS_OUTPUT.PUT_LINE('Tipo: ' || r_producto.Tipo_producto);
        DBMS_OUTPUT.PUT_LINE('Stock: ' || r_producto.Stock);
        DBMS_OUTPUT.PUT_LINE('-------------------');
    END LOOP;
    CLOSE c_productos;
END;

/
--------------------------------------------------------
--  DDL for Package PAQUETE_ACTUALIZAR_STOCK
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "PAQUETE_ACTUALIZAR_STOCK" AS
    PROCEDURE Actualizar_Stock_Medicamento(id IN INT, cantidad IN INT);
    PROCEDURE Actualizar_Stock_Juguete(id IN INT, cantidad IN INT);
    PROCEDURE Actualizar_Stock_Alimento(id IN INT, cantidad IN INT);
END Paquete_Actualizar_Stock;

/
--------------------------------------------------------
--  DDL for Package Body PAQUETE_ACTUALIZAR_STOCK
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "PAQUETE_ACTUALIZAR_STOCK" AS
    PROCEDURE Actualizar_Stock_Medicamento(id IN INT, cantidad IN INT) AS
    BEGIN
        UPDATE Medicamentos SET Stock = Stock + cantidad WHERE Medicamento_id = id;
    END Actualizar_Stock_Medicamento;

    PROCEDURE Actualizar_Stock_Juguete(id IN INT, cantidad IN INT) AS
    BEGIN
        UPDATE Juguetes SET Stock = Stock + cantidad WHERE Juguete_id = id;
    END Actualizar_Stock_Juguete;

    PROCEDURE Actualizar_Stock_Alimento(id IN INT, cantidad IN INT) AS
    BEGIN
        UPDATE Alimentos SET Stock = Stock + cantidad WHERE Alimento_id = id;
    END Actualizar_Stock_Alimento;
END Paquete_Actualizar_Stock;

/
--------------------------------------------------------
--  DDL for Function BUSCARMASCOTAPORNOMBRE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "BUSCARMASCOTAPORNOMBRE" (
    p_nombre VARCHAR2
)
RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT Mascota_id, Nombre, Especie, Edad, Cliente_id, Raza
        FROM Mascotas
        WHERE Nombre = p_nombre;

    RETURN v_cursor;
END;

/
--------------------------------------------------------
--  DDL for Function CALCULARPRECIOTOTALINVENTARIO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "CALCULARPRECIOTOTALINVENTARIO" (
    p_producto_id INT DEFAULT NULL
)
RETURN NUMBER
IS
    total_precio NUMBER;
BEGIN
    IF p_producto_id IS NULL THEN
        SELECT SUM(i.Precio_producto * (
                    COALESCE(m.Stock * m.Precio, 0) +
                    COALESCE(j.Stock * j.Precio, 0) +
                    COALESCE(a.Stock * a.Precio, 0)
                  )) INTO total_precio
        FROM Inventario i
        LEFT JOIN Medicamentos m ON i.Medicamento_id = m.Medicamento_id
        LEFT JOIN Juguetes j ON i.Juguete_id = j.Juguete_id
        LEFT JOIN Alimentos a ON i.Alimento_id = a.Alimento_id;
    ELSE
        SELECT i.Precio_producto * (
                    COALESCE(m.Stock * m.Precio, 0) +
                    COALESCE(j.Stock * j.Precio, 0) +
                    COALESCE(a.Stock * a.Precio, 0)
                  ) INTO total_precio
        FROM Inventario i
        LEFT JOIN Medicamentos m ON i.Medicamento_id = m.Medicamento_id
        LEFT JOIN Juguetes j ON i.Juguete_id = j.Juguete_id
        LEFT JOIN Alimentos a ON i.Alimento_id = a.Alimento_id
        WHERE i.Inventario_id = p_producto_id;
    END IF;

    RETURN total_precio;
END;

/
--------------------------------------------------------
--  DDL for Function CALCULAR_PRECIO_TOTAL_VENTA
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "CALCULAR_PRECIO_TOTAL_VENTA" (
    p_medicamento_id INT, 
    p_juguete_id INT, 
    p_alimento_id INT, 
    p_cantidad INT
) RETURN DECIMAL IS
    v_precio_total DECIMAL(10, 2);
BEGIN
    -- Inicializamos el precio total a 0
    v_precio_total := 0;

    -- Sumamos el precio de cada tipo de producto, si existe, multiplicado por la cantidad
    SELECT Precio * p_cantidad
    INTO v_precio_total
    FROM Medicamentos
    WHERE Medicamento_id = p_medicamento_id;

    SELECT Precio * p_cantidad
    INTO v_precio_total
    FROM Juguetes
    WHERE Juguete_id = p_juguete_id;

    SELECT Precio * p_cantidad
    INTO v_precio_total
    FROM Alimentos
    WHERE Alimento_id = p_alimento_id;

    RETURN v_precio_total;
END Calcular_Precio_Total_Venta;

/
--------------------------------------------------------
--  DDL for Function CONTARCLIENTESPORCIUDAD
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "CONTARCLIENTESPORCIUDAD" (
    p_ciudad VARCHAR2
)
RETURN NUMBER
IS
    contador NUMBER;
BEGIN
    SELECT COUNT(*) INTO contador
    FROM Clientes
    WHERE Direccion LIKE '%' || p_ciudad || '%';

    RETURN contador;
END;

/
--------------------------------------------------------
--  DDL for Function OBTENEREDADPROMEDIOMASCOTAS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "OBTENEREDADPROMEDIOMASCOTAS" 
RETURN NUMBER
IS
    promedio_edad NUMBER;
BEGIN
    SELECT AVG(Edad) INTO promedio_edad
    FROM Mascotas;

    RETURN promedio_edad;
END;

/
--------------------------------------------------------
--  DDL for Function OBTENERPRECIOTOTALMEDICAMENTOS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "OBTENERPRECIOTOTALMEDICAMENTOS" 
RETURN NUMBER
IS
    total_precio NUMBER;
BEGIN
    SELECT SUM(Stock * Precio) INTO total_precio
    FROM Medicamentos;

    RETURN total_precio;
END;

/
--------------------------------------------------------
--  DDL for Function OBTENER_EDAD_PROMEDIO_MASCOTAS_CLIENTE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "OBTENER_EDAD_PROMEDIO_MASCOTAS_CLIENTE" (p_cliente_id INT) RETURN INT IS
    v_edad_promedio INT;
BEGIN
    SELECT AVG(Edad)
    INTO v_edad_promedio
    FROM Mascotas
    WHERE Cliente_id = p_cliente_id;

    RETURN v_edad_promedio;
END Obtener_Edad_Promedio_Mascotas_Cliente;

/
--------------------------------------------------------
--  DDL for Function VERIFICARSTOCKPRODUCTO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "VERIFICARSTOCKPRODUCTO" (
    p_producto_id INT
)
RETURN NUMBER
IS
    total_stock NUMBER;
BEGIN
    SELECT COALESCE(m.Stock, 0) + COALESCE(j.Stock, 0) + COALESCE(a.Stock, 0) INTO total_stock
    FROM Inventario i
    LEFT JOIN Medicamentos m ON i.Medicamento_id = m.Medicamento_id
    LEFT JOIN Juguetes j ON i.Juguete_id = j.Juguete_id
    LEFT JOIN Alimentos a ON i.Alimento_id = a.Alimento_id
    WHERE i.Inventario_id = p_producto_id;

    RETURN total_stock;
END;

/
--------------------------------------------------------
--  Ref Constraints for Table CITAS
--------------------------------------------------------

  ALTER TABLE "CITAS" ADD FOREIGN KEY ("CLIENTE_ID")
	  REFERENCES "CLIENTES" ("CLIENTE_ID") ENABLE;
  ALTER TABLE "CITAS" ADD FOREIGN KEY ("MASCOTA_ID")
	  REFERENCES "MASCOTAS" ("MASCOTA_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HISTORIAL
--------------------------------------------------------

  ALTER TABLE "HISTORIAL" ADD FOREIGN KEY ("MASCOTA_ID")
	  REFERENCES "MASCOTAS" ("MASCOTA_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INVENTARIO
--------------------------------------------------------

  ALTER TABLE "INVENTARIO" ADD FOREIGN KEY ("MEDICAMENTO_ID")
	  REFERENCES "MEDICAMENTOS" ("MEDICAMENTO_ID") ENABLE;
  ALTER TABLE "INVENTARIO" ADD FOREIGN KEY ("JUGUETE_ID")
	  REFERENCES "JUGUETES" ("JUGUETE_ID") ENABLE;
  ALTER TABLE "INVENTARIO" ADD FOREIGN KEY ("ALIMENTO_ID")
	  REFERENCES "ALIMENTOS" ("ALIMENTO_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MASCOTAS
--------------------------------------------------------

  ALTER TABLE "MASCOTAS" ADD FOREIGN KEY ("CLIENTE_ID")
	  REFERENCES "CLIENTES" ("CLIENTE_ID") ENABLE;
