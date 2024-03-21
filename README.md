# Lenguajes de Bases de Datos Q1'24
# Desglose de Contribuciones del Equipo (Grupo 3)

## Salim

### Funciones
- `ObtenerPrecioTotalMedicamentos`: Calcula el precio total de los medicamentos.
- `ContarClientesPorCiudad`: Cuenta los clientes distribuidos por ciudad.
- `ObtenerEdadPromedioMascotas`: Calcula la edad promedio de las mascotas.
- `BuscarMascotaPorNombre`: Busca mascotas por su nombre.
- `CalcularPrecioTotalInventario`: Calcula el precio total de los items en inventario.
- `VerificarStockProducto`: Verifica el stock de un producto específico.

### Cursores
- `ListarMascotasPorCliente`: Lista las mascotas asociadas a un cliente.
- `HistorialMedicoMascota`: Muestra el historial médico de las mascotas.
- `ProductosBajoStock`: Identifica los productos con stock bajo.

### Scripts de Python
- `calcular_precio_total_inventario.py`
- `contar_clientes_por_ciudad.py`
- `obtener_edad_promedio_mascotas.py`
- `obtener_precio_total_medicamentos.py`
- `paquete_actualizar_stock.py`

### Otros
- Investigación sobre la conexión a la base de datos mediante Python. 

## Gabriel

### Vistas
- `Vista_Clientes_Mascotas`: Muestra la relación entre clientes y mascotas.
- `Vista_Stock_Productos`: Detalla el stock de los productos.
- `Vista_Citas_Pendientes`: Lista las citas pendientes.

### Paquetes
- `Paquete_Actualizar_Stock`: Incluye la lógica para actualizar el stock.
  - `PACKAGE`
  - `PACKAGE BODY`

### Funciones
- `Calcular_Precio_Total_Venta`: Calcula el precio total de una venta.
- `Obtener_Edad_Promedio_Mascotas_Cliente`: Calcula la edad promedio de las mascotas de un cliente.

### Cursores
- Cursor para recorrer las citas pendientes.
- Cursor para obtener mascotas con edades menores a un valor específico. 

## Daniel

### Tablas
- `Clientes`
- `Medicamentos`
- `Juguetes`
- `Alimentos`
- `Citas`
- `Historial`
- `Mascotas`

### Procedimientos
- CRUD para `Clientes`, `Mascotas`, `Juguetes`, y `Medicamentos`. 

## Jeancarlo 

### Procedimientos
- CRUD para `Alimento`, `Citas`, `Historial`, y `Inventario`. 

## Roberto 

### Tablas
- `Inventario`

### Vistas
- `Vista_Citas`
- `Vista_Clientes`
- `Vista_Productos`
  - (`PACKAGE`)
  - (`PACKAGE BODY`)

### Paquetes
- `productos_package`
- `citas_package`
- `clientes_package`

### Triggers
- `actualizar_stock_despues_compra`: Actualiza el stock después de una compra.
- `registrar_historial_citas`: Registra el historial de citas.
- `actualizar_precio_promedio_despues_venta`: Actualiza el precio promedio después de una venta. 
