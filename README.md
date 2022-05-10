# Proyecto BDA: Vitual GYM


##  Caso de estudio

Virtual Gym es una empresa que cuenta con diversos gimnasios distribuidos en todo el país. Adicional a los servicios que ofrece en cada uno de sus gimnasios, la empresa ha decidido modernizarse a través de un proyecto que permite a sus clientes tomar clases en línea o a distancia, o inclusive en diferentes gimnasios a los que habitualmente acuden. Se registran los siguientes datos de cada gimnasio: folio de 5 caracteres, nombre, dirección, ubicación (latitud y longitud), teléfono principal, página web. Cada Gimnasio cuenta con una serie de contenido multimedia que se emplea para mantener actualizado el sitio web. Este contenido se guarda en la BD: imágenes y videos. A cada archivo se le asigna una vigencia. Posteriormente, el archivo ya no se emplea en el sitio web. Se desea mantener todo este material, aunque ya esté fuera de línea.

Los empleados de Virtual Gym cuentan con un registro único: nombre, apellidos, CURP, número de trabajador, RFC, fecha de nacimiento y puesto el cual proviene de un catálogo (nombre, clave y descripción), email, foto y sus 10 huellas dactilares. Estos datos se emplean entre otras cosas para configurar los accesos en los gimnasios empleando las huellas dactilares. Existe una clasificación de empleados en 2 grupos: Administrativos e Instructores. Para los administradores se almacena login, password, rol de administrador y un archivo binario con extensión .cer (certificado digital) el cual se emplea para acceder al sitio web de administración. Para los instructores se almacena cédula profesional que lo habilita como instructor calificado, años de experiencia, instructor suplente. Cada instructor puede registrar URLs que pueden ser consultadas públicamente para revisar su trayectoria.

Cada gimnasio está formado por un conjunto de salas. Para cada sala se guarda su clave de 3 caracteres, su nombre, capacidad máxima (número de personas), y una lista de las disciplinas que pueden practicarse en dicha sala. Se cuenta con un catálogo de disciplinas: (clave, nombre, descripción, ícono que describe la disciplina empleada como logotipo en documentos, y en el sitio web). Cada sala cuenta con un administrador (empleado). Cada gimnasio cuenta con un gerente.

En cada sala se encuentran una serie de aparatos o dispositivos para realizar rutinas. Se cuenta con un inventario en el que se registra: número de inventario (cadena de 18 caracteres), tipo de dispositivo (se cuenta con catálogo), nombre del dispositivo, fecha de adquisición, y descripción. Para cada dispositivo se han definido una serie de status para administrar su ciclo de vida: vigente, obsoleto, averiado, en reparación, fuera de uso. Se requiere guardar estos estados y su correspondiente historial.

Para el caso de los clientes se cuenta con el siguiente registro: nombre, apellidos, email, username, password, dirección (sin desglosar), fecha de nacimiento, CURP, foto. Con este registro el cliente puede acudir al gimnasio de su preferencia. Se le genera una credencial cuyos datos son: folio de 8 caracteres, vigencia, código de barras empleado para acceder a las salas.

Virtual Gym ofrece a sus clientes la posibilidad de adquirir un sensor que permite medir la cantidad de calorías aproximada que se consumen durante cada una de las sesiones del cliente. Se cuenta con una itácora en la que cada minuto se registra el valor de las calorías que el cliente logra liberar en dicho intervalo. Para cada sesión se guardan los siguientes datos: Número de sesión (folio consecutivo por cliente), fecha de inicio, duración de la sesión, instructor responsable, dispositivo(s) empleado(s) durante la sesión. Virtual Gym permite que los clientes puedan tener sesiones remotas con sus instructores, por ejemplo, el cliente puede realizar una rutina de 30 min en su casa. El sensor reporta los datos de sus calorías sin importar el lugar donde se encuentre. En base de datos se almacena la sala en la que se realiza la sesión o en su defecto se indica el valor “En línea” para los casos en el que el cliente realiza su rutina en casa. Para cada sensor se almacena su número de serie, fecha de compra y marca.

Finalmente, el cliente puede consultar en el sitio web el avance y el resumen de sus sesiones, por ejemplo, el sistema puede mostrarle gráficas en donde se muestra el historial de pérdida de calorías. Para generar reportes más completos, el cliente puede capturar periódicamente los datos de su peso y masa corporal y de ser necesario su estatura. Cada vez que el cliente realiza un ajuste en su peso, masa o inclusive estatura, se agrega un nuevo registro para mantener la historia o evolución de sus medidas.

Requerimientos no funcionales:
-Se tiene un aproximado de 5,000 gimnasios distribuidos a lo largo del país. 
-Se requiere almacenar todas las mediciones de calorías que el cliente genera a lo largo de su estancia en los gimnasios de Virtual Gym.
-Se requiere almacenar toda la historia del material multimedia que tiene Virtual Gym para actualizar sus sitios web.
-Se requiere capacidad para realizar consultas estadísticas para poder mostrar el avance o progreso de un cliente.
-Cada gimnasio ha reportado hasta 1500 usuarios registrados durante un año, existen clientes que realizan hasta 5 rutinas por semana con una duración de hasta 2 hrs.


## Diseno logico

![](DisenoLogico/diseno.jpg)


## Creacion de BD

### Scripts

### Configuracion inicial
|Configuración|Descripción|
|:-----------:|:---------------------------:|
|Archivos de control|`/u01/disk1/control01.ctl`<br>`/u01/disk2/control02.ctl`<br>`/u01/disk3/control03.ctl`|
|Propuesta de grupos REDO|3 grupos REDO, cada uno contiene 3 archivos REDO.|
|Propuesta de juego de caracteres|`character set AL32UTF8`<br>`national character set AL16UTF16`|
|Tamaño del bloque de datos|`512B`|
|Parámetros para creacion de BD|`db_name=elrobda`<br>`memory_target=5G`<br>`control_files=(/u01/disk1/control01.ctl, /u01/disk2/control02.ctl, /u01/disk3/control03.ctl)`|
|Archivo de passwords|`sys`<br>`sysbackup`|

### Modulos del sistema
|Nombre del módulo|Descripción|Usuario|
|:---------------:|:---------:|:-----:|
|Gimnasio|Objetos relacionados con la organizacion e infraestructura del gimnasio.|`gimnasio01`|
|Cliente|Objetos relacionados con la actividad de los clientes.|`cliente01`|
