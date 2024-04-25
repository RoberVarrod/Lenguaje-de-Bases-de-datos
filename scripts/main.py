import subprocess

def run_script(script_name):
    try:
        subprocess.run(['python', script_name], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error ejecutando script: {e}")

def main():
    print("Bienvenido a la interfaz Python de la veterinaria!")
    print("Seleccione el tipo de script que desea correr:")
    print("1. Vistas")
    print("2. Paquetes Almacenados")
    print("3. Funciones")
    choice = input("Elija una opcion (1/2/3): ")

    if choice == '1':
        print("Elija una vista a mostrar:")
        view_scripts = [
            "vist/vista_citas.py",
            "vist/vista_clientes.py",
            "vist/vista_juguetes_stock.py",
            "vist/vista_mascotas_duenos.py",
            "vist/vista_medicamentos_stock.py"
        ]
        for i, script in enumerate(view_scripts, start=1):
            print(f"{i}. {script}")
        view_choice = int(input("Opcion: "))
        if 1 <= view_choice <= len(view_scripts):
            run_script(view_scripts[view_choice - 1])
        else:
            print("Opcion invalida. Por favor ingrese una opcion valida.")

    elif choice == '2':
        run_script("paquete_actualizar_stock.py")

    elif choice == '3':
        print("Elija una funcion a ejecutar:")
        function_scripts = [
            "func/calcular_precio_total_inventario.py",
            "func/contar_clientes_por_ciudad.py",
            "func/obtener_edad_promedio_mascotas.py",
            "func/obtener_precio_total_medicamentos.py"
        ]
        for i, script in enumerate(function_scripts, start=1):
            print(f"{i}. {script}")
        function_choice = int(input("Opcion: "))
        if 1 <= function_choice <= len(function_scripts):
            run_script(function_scripts[function_choice - 1])
        else:
            print("Opcion invalida. Por favor ingrese una opcion valida.")
    else:
        print("Opcion invalida. Por favor ingrese una opcion valida.")

if __name__ == "__main__":
    main()
