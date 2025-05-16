
# Toolkit Administrativo - Sistemas Operativos (Evidencia 1)

  

Este proyecto es un conjunto de scripts Bash que conforman un *toolkit administrativo básico* para sistemas operativos tipo Unix/Linux. Está diseñado para facilitar acciones comunes de **monitoreo de procesos** y **gestión de archivos y directorios** desde una interfaz amigable en terminal.

  

---

  

## Contenido Actual del Toolkit

  

Este módulo inicial incluye:

  

### Gestión de Procesos

  

1.  **Ver procesos activos:**

-  Esta función lista los procesos actualmente en ejecución, mostrando los 30 que más CPU consumen.
Utiliza el siguiente comando para presentar la información en columnas organizadas:

```bash
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 30
```
Se muestra:

- PID del proceso

- Usuario que lo ejecuta

- Porcentaje de uso de CPU

- Porcentaje de uso de memoria

- Comando que originó el proceso

Este resumen facilita identificar rápidamente procesos pesados o inusuales.  

2.  **Consultar información detallada de un proceso:**

- El usuario ingresa un PID y obtiene información con el comando:

```bash

ps -p <PID> -o pid,ppid,user,%cpu,%mem,cmd

```

  

3.  **Finalizar un proceso manualmente:**

- El usuario ingresa un PID, confirma la acción, y se envía una señal `SIGTERM (15)` al proceso:

```bash

kill -15 <PID>

```

  

4.  **Ejecutar comandos habituales sobre procesos:**

- Permite elegir entre:

-  `ps aux` – Muestra todos los procesos.

-  `top -b -n 1` – Top en modo batch.

-  `pgrep <nombre>` – Buscar PID por nombre.

-  `kill <PID>` – Finalizar proceso directamente.

 

---

  

#### Gestión de Archivos y Directorios

  

5.  **Crear un archivo nuevo:**

- El usuario ingresa **nombre** y **extensión** por separado.

- Se usa el comando:

```bash

touch <nombre>.<extensión>

```

  

6.  **Crear un directorio:**

- El usuario define un nombre (con validación de formato).

- Se utiliza:

```bash

mkdir <nombre_directorio>

```

  

---

  

## Cómo obtener y utilizar el Toolkit


###  **Requisitos Previos:**

-**Git** instalado (para clonar el repositorio):  
  ```bash
  git --version
  ``` 
-****Bash** (shell de Linux/Unix) disponible: 
  ```bash
  bash --version
 ```
-   **Sistema operativo**  tipo Unix/Linux.
    
-   **Acceso a Internet**  para clonar el repositorio.
    
-   **Permisos**  de ejecución en el directorio de trabajo.
 
##  **Pasos:**

1. **Clonar el repositorio**  
```bash
   git clone https://github.com/programando18/sistemas_operativos_2025.git
```
2. **Ingresar al directorio del proyecto**
```bash
cd sistemas_operativos_2025
```
3. **Dar permisos de ejecución**
```bash
chmod +x main_toolkit.sh procesos.sh archivos.sh
```
4. **Ejecutar el Toolkit**
```bash
./main_toolkit.sh
```
5. **Navegar Por el Menú**
 -   Al iniciarse, se mostrará un **menú numerado**  con todas las opciones. 
 -   Escribir el **número**  de la acción que se desea realizar y presionr **Enter**.
-  Seguir las instrucciones en pantalla para completar la tarea.

### 📂 Estructura del Proyecto
toolkit/

├── main_toolkit.sh      # Script principal

├── bprocesos.sh            # Funciones para gestión de procesos

└── archivos.sh             # Funciones para archivos y directorios
## </> Comandos de Linux Utilizados

-   `ps`
    
-   `top` (en modo batch)
    
-   `pgrep`
    
-   `kill`
    
-   `touch`
    
-   `mkdir`
---
## Estado de la Evidencia 1

### **Implementado en esta entrega:**

-   Monitoreo de procesos (ps aux, top).
    
-   Consulta detallada de procesos por PID.
    
-   Finalización de procesos con SIGTERM y confirmación.
    
-   Creación de directorios con validación de nombre.
    
-   Creación de archivos con nombre y extensión separados.
    
