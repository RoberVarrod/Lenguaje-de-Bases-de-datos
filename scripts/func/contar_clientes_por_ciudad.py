import cx_Oracle
try:
    #Crear conexion
    conn=cx_Oracle.connect('VeterinariaMF/admin1234@localhost:1521/orcl')
except Exception as err:
    print('Error al crear la conexion:',err)
else:
    try:
        #Crear cursor
        cur = conn.cursor()
        ciudad = [input('Ingrese la ciudad: ')]
        result = cur.callfunc('ContarClientesPorCiudad', int, ciudad)
    except Exception as err:
        print('Error al ejecutar la funcion:',err)
    else:
        print('Resultado: ',result)
    finally:
        cur.close()
finally:
    conn.close()