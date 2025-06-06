
# Toolkit Administrativo - Sistemas Operativos (Evidencia 3)

Este proyecto es un conjunto de scripts Bash que conforman un _toolkit administrativo básico_ para sistemas operativos tipo Unix/Linux. Está diseñado para facilitar tareas habituales de gestión del sistema, monitoreo, seguridad, y administración de usuarios mediante una interfaz interactiva y amigable desde terminal.

---

## Contenido Actual del Toolkit

Este módulo inicial incluye:

### Gestión de Procesos

1. **Ver procesos activos:**

- Lista los 30 procesos que más CPU consumen, mostrando PID, usuario, %CPU, %MEM y comando.

```bash
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 30
# -eo: especifica campos; 
# --sort=-%cpu: ordena descendente por uso CPU
```

2. **Consultar información detallada de un proceso:**

* El usuario ingresa un PID y obtiene información detallada:

```bash
ps -p <PID> -o pid,ppid,user,%cpu,%mem,cmd
```

3. **Finalizar un proceso manualmente:**

* El usuario ingresa un PID, confirma la acción y se envía señal SIGTERM (15), que solicita al proceso terminar:

```bash
kill -15 <PID>
```

4. **Ejecutar comandos habituales sobre procesos:**

* Permite elegir entre:

  * `ps aux` – Muestra todos los procesos.
  * `top -b -n 1` – Top en modo batch.
  * `pgrep <nombre>` – Buscar PID por nombre.
  * `kill <PID>` – Finalizar proceso directamente.

---

### Gestión de Archivos y Directorios

5. **Crear un archivo nuevo:**

* El usuario ingresa **nombre** y **extensión** por separado.

```bash
touch <nombre>.<extensión>
```

6. **Crear un directorio:**

* El usuario define un nombre (con validación de formato).

```bash
mkdir <nombre_directorio>
```

7. **Listar archivos en un directorio:**

* El usuario ingresa el directorio a listar y se muestra el contenido con:

```bash
ls -l <directorio>
```

---

### Gestión de Disco

1. **Mostrar espacio libre y utilizado:**

* Muestra el espacio ocupado y libre en discos montados.

```bash
df -h
```

2. **Mostrar el tamaño ocupado por un directorio/archivo:**

* El usuario especifica una ruta y se muestra el tamaño.

```bash
du -sh <ruta>
```

3. **Comandos habituales sobre disco:**

* Permite elegir y ejecutar:

  * `df` – Estado del disco.
  * `du` – Uso de espacio por carpeta.
  * `ls` – Listado de archivos con detalles.

---

### Gestión de Usuarios y Grupos

1. **Mostrar usuarios del sistema:**

* Lista usuarios de sistema (UID < 1000) y usuarios normales (UID >= 1000), usando `getent` o `/etc/passwd`.

2. **Mostrar grupos del sistema:**

* Lista grupos de sistema (GID < 1000) y grupos normales (GID >= 1000), usando `getent` o `/etc/group`.

---

### Diagnóstico de Memoria y Sistema de Archivos

1. **Diagnóstico de memoria (script: `diagnostico_memoria.sh`):**

* Realiza un análisis exclusivo de uso de **memoria RAM y SWAP**, estadísticas del sistema, y procesos que consumen más memoria.

* Comandos utilizados:

  * `free -h` → Estado de la RAM y SWAP.
  * `vmstat -s` → Estadísticas de memoria (buffers, caché, total y libre).
  * `head /proc/meminfo` → Información detallada del sistema.
  * `ps` → Lista de procesos ordenados por uso de memoria.

* Ideal si solo se necesita monitoreo de memoria del sistema.

2. **Diagnóstico combinado (script: `memoria.sh`):**

* Amplía el diagnóstico anterior incluyendo también el **estado del sistema de archivos**.

* Incluye todos los comandos anteriores **más**:

  * `df -h` → Uso de disco por sistema de archivos.

* Integra en un solo paso el monitoreo de **memoria y almacenamiento**, útil para diagnósticos más completos.

---

### Análisis de Seguridad (logs)

1. **Revisión básica de logs y seguridad:**

* Ver últimas 15 líneas de `/var/log/auth.log`.

* Buscar errores de autenticación con la palabra "Failed".

* Ver errores recientes del sistema con `journalctl`.

* Logs SSH en las últimas 2 horas.

* Comandos habituales: sesiones (`last`, `lastb`), listado de archivos (`ls -l`), búsquedas por texto (`grep`), logs recientes (`journalctl -xe`).

---

## Cómo obtener y utilizar el Toolkit

### Requisitos Previos

* **Git** instalado (para clonar el repositorio):

```bash
git --version
```

* **Bash** (shell de Linux/Unix) disponible:

```bash
bash --version
```

* **Sistema operativo** tipo Unix/Linux.

* **Acceso a Internet** para clonar el repositorio.

* **Permisos** de ejecución en el directorio de trabajo.

---

### Pasos

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
chmod +x main_toolkit.sh procesos.sh archivos.sh disco.sh usuarios.sh memoria.sh diagnostico_memoria.sh seguridad.sh
```

4. **Ejecutar el Toolkit**

```bash
./main_toolkit.sh
```

5. **Navegar por el menú**

* Al iniciarse, se mostrará un **menú numerado** con todas las opciones.

* Escribir el **número** de la acción que se desea realizar y presionar **Enter**.

* Seguir las instrucciones en pantalla para completar la tarea.

---

## 📂 Estructura del Proyecto

```
toolkit/
├── main_toolkit.sh          # Script principal  
├── procesos.sh              # Funciones para gestión de procesos  
├── archivos.sh              # Funciones para archivos y directorios  
├── disco.sh                 # Funciones y utilidades de disco          
├── diagnostico_memoria.sh   # Diagnóstico exclusivo de memoria  
├── usuarios.sh              # Gestión de usuarios y grupos  
├── memoria.sh               # Diagnóstico rápido de memoria y estado del sistema de archivos   
└── seguridad.sh             # Comandos y revisión básica de seguridad (opcional)
```

---

## \</> Comandos de Linux Utilizados

* `ps`
* `top` (modo batch)
* `pgrep`
* `kill`
* `touch`
* `mkdir`
* `ls`
* `df`
* `du`
* `getent`
* `awk`
* `column`
* `grep`
* `journalctl`
* `last`
* `lastb`
* `head`

---

## Estado de la Evidencia 3

### Implementado en esta entrega:

* Monitoreo de procesos (`ps aux`, `top`).

* Consulta detallada de procesos por PID.

* Finalización de procesos con SIGTERM y confirmación.

* Creación de directorios con validación de nombre.

* Creación de archivos con nombre y extensión separados.

* Listado de archivos y directorios.

* Diagnóstico rápido de memoria (RAM, SWAP, procesos, `/proc/meminfo`).

* Comandos y monitoreo de disco (`df`, `du`, `ls`).

* Listado de usuarios y grupos del sistema.

* Revisión básica de logs de seguridad y sesiones (`auth.log`, `journalctl`, `last`, `lastb`).

---

