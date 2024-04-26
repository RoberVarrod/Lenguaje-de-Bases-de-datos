import cx_Oracle

try:
    # Crear conexión
    conn = cx_Oracle.connect('VeterinariaMF/admin1234@localhost:1521/orcl')
except Exception as err:
    print('Error al crear la conexión:', err)
else:
    try:
        # Crear cursor
        cur = conn.cursor()

        # Definir parámetro de entrada
        id = input('Ingrese el ID del producto (dejar vacío para total): ')
        if id.strip(): 
            id = int(id)  
        else:
            id = None  

        # Llamar a la función
        result = cur.callfunc('CalcularPrecioTotalInventario', cx_Oracle.NUMBER, [id])

        # Imprimir resultado
        print('Resultado: ', result)

    except Exception as err:
        print('Error al ejecutar la función:', err)
    finally:
        cur.close()
finally:
    conn.close()
