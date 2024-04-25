import cx_Oracle

try:
    conn = cx_Oracle.connect('VeterinariaMF/admin1234@localhost:1521/orcl')
except Exception as err:
    print('Error al crear la conexión:', err)
else:
    try:
        cur = conn.cursor()
        cur.execute('SELECT * FROM VISTA_JUGUETES_STOCK')
        rows = cur.fetchall()
        for row in rows:
            print(row)
    except Exception as err:
        print('Error al ejecutar la consulta:', err)
    finally:
        cur.close()
finally:
    conn.close()
