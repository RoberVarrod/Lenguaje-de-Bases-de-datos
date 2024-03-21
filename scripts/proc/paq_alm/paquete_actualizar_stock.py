import cx_Oracle

try:
    # Crear connection
    conn = cx_Oracle.connect('VeterinariaMF/admin1234@localhost:1521/orcl')
except Exception as err:
    print('Error al crear la conexion:',err)
else:
    try:
        # Crear cursor
        cur = conn.cursor()

        def actualizar_stock_medicamento(id, cantidad):
            # Procedimiento para medicamentos
            cur.callproc('Paquete_Actualizar_Stock.Actualizar_Stock_Medicamento', [id, cantidad])
            print(f"Actualizando stock: ID={id}, Cantidad={cantidad}")

        def actualizar_stock_juguete(id, cantidad):
            # Procedimiento para juguetes
            cur.callproc('Paquete_Actualizar_Stock.Actualizar_Stock_Juguete', [id, cantidad])
            print(f"Actualizando stock: ID={id}, Cantidad={cantidad}")

        def actualizar_stock_alimento(id, cantidad):
            # Procedimiento para alimentos
            cur.callproc('Paquete_Actualizar_Stock.Actualizar_Stock_Alimento', [id, cantidad])
            print(f"Actualizando stock: ID={id}, Cantidad={cantidad}")

        def main():
            print("Elija el tipo de producto que desea actualizar:")
            print("1. Actualizar Stock Medicamento")
            print("2. Actualizar Stock Juguete")
            print("3. Actualizar Stock Alimento")

            choice = input("Enter your choice (1/2/3): ")

            if choice not in ['1', '2', '3']:
                print("Error, opcion no valida.")
                return

            id = input("Enter the ID: ")
            cantidad = input("Enter the cantidad: ")

            try:
                id = int(id)
                cantidad = int(cantidad)
            except ValueError:
                print("Solo utilizar numeros enteros.")
                return

            if choice == '1':
                actualizar_stock_medicamento(id, cantidad)
            elif choice == '2':
                actualizar_stock_juguete(id, cantidad)
            elif choice == '3':
                actualizar_stock_alimento(id, cantidad)

        if __name__ == "__main__":
            main()

    except Exception as err:
        print('Error ejecutando procedimiento:', err)
    finally:
        cur.close()
finally:
    conn.close()