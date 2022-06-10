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
<li>Se tiene un aproximado de 5,000 gimnasios distribuidos a lo largo del país.
<li>Se requiere almacenar todas las mediciones de calorías que el cliente genera a lo largo de su estancia en los gimnasios de Virtual Gym.
<li>Se requiere almacenar toda la historia del material multimedia que tiene Virtual Gym para actualizar sus sitios web.
<li>Se requiere capacidad para realizar consultas estadísticas para poder mostrar el avance o progreso de un cliente.
<li>Cada gimnasio ha reportado hasta 1500 usuarios registrados durante un año, existen clientes que realizan hasta 5 rutinas por semana con una duración de hasta 2 hrs.


## Diseño lógico

![](DISENO_LOGICO/diseno.jpg)


## Creacion de BD

### Scripts
|Número|Nombre de script|Descripción|
|:----:|:--------------:|:---------:|
|1|[s-01-crea-pwd-oracle](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-01-crea-pwd-oracle.sh "s-02-crea-pwd-oracle")|Crea archivo de passwords.|
|2|[s-02-crea-pfile-oracle](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-02-crea-pfile-oracle.sh "s-03-crea-pfile-oracle")|Crea archivo PFILE.|
|3|[s-03-crea-spfile-ordinario](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-03-crea-spfile-ordinario.sql "s-04-crea-spfile-ordinario")|Crea archivo SPIFILE.|
|4|[s-04-crea-directorios-root](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-04-crea-directorios-root.sh "s-05-crea-directorios-root")|Crea directorios para BD.|
|5|[s-05-crea-bd-ordinario](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-05-crea-bd-ordinario.sql "s-06-crea-bd-ordinario")|Crea BD.|
|6|[s-06-crea-diccionario-datos-ordinario](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-06-crea-diccionario-datos-ordinario.sql "s-07-crea-diccionario-datos-ordinario")|Crea diccionario de datos.|
|7|[s-07-crea-tablespaces-ordinario](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-07-crea-tablespaces-ordinario.sql "s-09-crea-tablespaces-ordinario")|Crea tablespaces.|
|8|[s-08-crea-usuarios-ordinario](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-08-crea-tablespaces-ordinario.sql "s-09-crea-usuarios-ordinario")|Crea usuarios y otorga permisos.|
|9|[s-09-crea-objetos-00-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-09-crea-objetos-00-ordinario.sql "s-09-crea-objetos-00-ordinario.sql")|Crea objetos por módulo.|
|10|[s-10-configura-modo-compartido-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-10-configura-modo-compartido-ordinario.sql "s-10-configura-modo-compartido-ordinario.sql")|Configura modo compartido.|
|11|[s-11-configura-pool-conexiones-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-11-configura-pool-conexxiones-ordinario.sql "s-10-configura-pool-conexiones-ordinario.sql")|Configura pool de conexiones.|
|12|[s-12-activa-fra-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-12-activa-fra-ordinario.sql "s-12-activa-fra-ordinario.sql")|Activa FRA.|
|13|[s-13-activa-archivlog-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-13-activa-archivelog-ordinario.sql "s-13-activa-archivelog-ordinario.sql")|Configura modo archivelog.|
|14|[s-14-carga-inicial-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-14-carga-inicial-ordinario.sql "s-14-carga-inicial-ordinario.sql")|Carga inicial por módulo.|
|15|[s-15-activa-datos-redo-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-15-activa-datos-redo-ordinario.sql "s-15-activa-datos-redo-ordinario.sql")|Activa produccion de datos REDO.|
|16|[s-16-configura-rman-oracle.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-16-configura-rman-oracle.sql "s-16-configura-rman-oracle.sql")|Configura RMAN.|
|17|[s-17-backup-0-oracle.rman](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-17-backup-0-oracle.rman"s-17-backup-0-oracle.rman")|Ejecuta backup nivel 0.|
|18|[s-17-backup-1-diferencial-oracle.rman](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-17-backup-1-diferencial-oracle.rman"s-17-backup-1-diferencial-oracle.rman")|Ejecuta backup nivel 1 dierencial.|
|19|[s-17-backup-1-cumulativo-oracle.rman](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-17-backup-1-cumulativo-oracle.rman"s-17-backup-1-cumulativo-oracle.rman")|Ejecuta backup nivel 1 cumulativo.|
|20|[s-18-simula-carga-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-18-simula-carga-ordinario.sql"s-18-simula-carga-ordinario.sql")|Simula crga diaria por módulo.|
|21|[s-19-instance-recovery-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-19-instance-recovery-ordinario.sql"s-19-instance-recovery-ordinario.sql")|Ejecuta instance recovery.|
|22|[s-20-complete-media-recovery-ordinario.sql](https://github.com/CarlosAEH1/virtualGYM/blob/main/SCRIPTS/s-20-complete-media-recovery-ordinario.sql"s-20-complete-medoa-recovery-ordinario.sql")|Ejecuta complete media recovery.|

### Configuración inicial
|Configuración|Descripción|
|:-----------:|:---------:|
|Archivos de control|`/unam-bda/d11/app/oracle/oradata/ELROPROY/control01.ctl`<br>`/unam-bda/d12/app/oracle/oradata/ELROPROY/control02.ctl`<br>`/unam-bda/d13/app/oracle/oradata/ELROPROY/control03.ctl`|
|Propuesta de grupos REDO|3 grupos REDO, cada uno contiene 3 Redo Log Files.|
|Propuesta de juego de caracteres|`character set AL32UTF8`<br>`national character set AL16UTF16`|
|Tamaño del bloque de datos|`512K`|
|Parámetros para creacion de BD|`db_name=elroproy`<br>`memory_target=1G`<br>`control_files=(/unam-bda/d11/app/oracle/oradata/ELROPROY/control01.ctl, /unam-bda/d12/app/oracle/oradata/ELROPROY/control02.ctl, /unam-bda/d13/app/oracle/oradata/ELROPROY/control03.ctl)`|
|Archivo de passwords|`sys`<br>`sysbackup`|

### Módulos del sistema
|Nombre del módulo|Descripción|Usuario|
|:---------------:|:---------:|:-----:|
|Gimnasio|Objetos relacionados con la organización e infraestructura del gimnasio.|`gimnasio01`|
|Cliente|Objetos relacionados con la actividad de los clientes.|`cliente01`|

### Esquemas por módulo
|Nombre de la tabla|Nombre del módulo|
|:----------------:|:---------------:|
|`PUESTO`|Gimnasio|
|`EMPLEADO`|Gimnasio|
|`ADMINISTRADOR`|Gimnasio|
|`INSTRUCTOR`|Gimnasio|
|`CLIENTE`|Cliente|
|`GIMNASIO`|Gimnasio|
|`SALA`|Gimnasio|
|`SESION`|Cliente|
|`BITACORA`|Cliente|
|`CREDENCIAL`|Cliente|
|`DISCIPLINA`|Gimnasio|
|`STATUS`|Gimnasio|
|`TIPO_DISPOSITIVO`|Gimnasio|
|`DISPOSITIVO`|Gimnasio|
|`HUELLA`|Gimnasio|
|`INSTRUCTOR_WEB`|Gimnasio|
|`MULTIMEDIA`|Gimnasio|
|`REPORTE`|Cliente|
|`SALA_DISCIPLINA`|Gimnasio|
|`SENSOR`|Cliente|
|`SESION_DISPOSITIVO`|Cliente|
|`STATUS_DISPOSITIVO`|Gimnasio|

### Esquema de indexado
|Módulo|Nombre de la tabla|Nombre del índice|Tipo|Propósito|
|:----:|:----------------:|:---------------:|:--:|:-------:|
|Gimnasio|`PUESTO`|`puesto_pk`|`unique`|Regla de negocio.|
|Gimnasio|`EMPLEADO`|`empleado_pk`|`unique`|Regla de negocio.|
|Gimnasio|`EMPLEADO`|`empleado_puesto_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`ADMINISTRADOR`|`administrador_pk`|`unique`|Regla de negocio.|
|Gimnasio|`INSTRUCTOR`|`instructor_pk`|`unique`|Regla de negocio.|
|Gimnasio|`CLIENTE`|`cliente_pk`|`unique`|Regla de negocio.|
|Gimnasio|`GIMNASIO`|`gimnasio_pk`|`unique`|Regla de negocio.|
|Gimnasio|`GIMNASIO`|`gimnasio_gerente_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`SALA`|`sala_pk`|`unique`|Regla de negocio.|
|Gimnasio|`SALA`|`sala_gimnasio_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`SALA`|`sala_emp_admin_id_ix`|`non unique`|Mejorar desempeño.|
|Cliente|`SESION`|`sesion_pk`|`unique`|Regla de negocio.|
|Cliente|`SESION`|`sesion_emp_inst_id_ix`|`non unique`|Mejorar desempeño.|
|Cliente|`SESION`|`sesion_cliente_id_ix`|`non unique`|Mejorar desempeño.|
|Cliente|`SESION`|`sesion_sala_id_id`|`non unique`|Mejorar desempeño.|
|Cliente|`BITACORA`|`bitacora_pk`|`unique`|Regla de negocio.|
|Cliente|`BITACORA`|`bitacora_sesion_id_ix`|`non unique`|Mejorar desempeño.|
|Cliente|`CREDENCIAL`|`credencial_pk`|`unique`|Regla de negocio.|
|Gimnasio|`DISCIPLINA`|`disciplina_pk`|`unique`|Regla de negocio.|
|Gimnasio|`STATUS`|`status_pk`|`unique`|Regla de negocio.|
|Gimnasio|`TIPO_DISPOSITIVO`|`tipo_dispositivo_pk`|`unique`|Regla de negocio.|
|Gimnasio|`DISPOSITIVO`|`dispositivo_pk`|`unique`|Regla de negocio.|
|Gimnasio|`DISPOSITIVO`|`dispositivo_tipo_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`DISPOSITIVO`|`dispositivo_sala_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`DISPOSITIVO`|`dispositivo_status_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`HUELLA`|`huella_pk`|`unique`|Regla de negocio.|
|Gimnasio|`INSTRUCTOR_WEB`|`instructor_web_pk`|`unique`|Regla de negocio.|
|Gimnasio|`MULTIMEDIA`|`multimedia_pk`|`unique`|Regla de negocio.|
|Gimnasio|`MULTIMEDIA`|`multimedia_gimnasio_id_ix`|`non unique`|Mejorar desempeño.|
|Cliente|`REPORTE`|`reporte_pk`|`unique`|Regla de negocio.|
|Cliente|`REPORTE`|`reporte_cliente_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`SALA_DISCIPLINA`|`sala_disciplina_pk`|`unique`|Regla de negocio.|
|Gimnasio|`SALA_DISCIPLINA`|`sala_disciplina_sala_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`SALA_DISCIPLINA`|`sala_disciplina_id_ix`|`non unique`|Mejorar desempeño.|
|Cliente|`SENSOR`|`sensor_pk`|`unique`|Regla de negocio.|
|Cliente|`SENSOR`|`sensor_cliente_id_ix`|`non unique`|Mejorar desempeño.|
|Cliente|`SESION_DISPOSITIVO`|`sesion_dispositivo_pk`|`unique`|Regla de negocio.|
|Cliente|`SESION_DISPOSITIVO`|`sesion_dispositivo_sesion_id_ix`|`non unique`|Mejorar desempeño.|
|Cliente|`SESION_DISPOSITIVO`|`sesion_dispositivo_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`STATUS_DISPOSITIVO`|`status_dispositivo_pk`|`unique`|Regla de negocio.|
|Gimnasio|`STATUS_DISPOSITIVO`|`status_dispositivo_id_ix`|`non unique`|Mejorar desempeño.|
|Gimnasio|`STATUS_DISPOSITIVO`|`status_DISPOSITIVO_status_id_id`|`non unique`|Mejorar desempeño.|


## Creación de tablespaces

### Definición de tablespaces comunes
|Nombre de tablespace|Configuración|
|:------------------:|:-----------:|
|`indices_ts`|`bigfile`<br>`50M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`/u01/app/oracle/oradata/ELROPROY/disk02/indices_df.dbf`|
|`blob_indices_ts`|`bigfile`<br>`50M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`/u01/app/oracle/oradata/ELROPROY/disk03/blob_indices_df.dbf`|
|`blob_ts`|`smallfile`<br>`100M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`u01/app/oracle/oradata/ELROPROY/disk04/blob01_df.dbf`, `u01/app/oracle/oradata/ELROPROY/disk05/blob02_df.dbf`|

### Definición de tablespaces comunes
|Modulo|Nombre de tablespace|Objetivo|Configuracion|
|:----:|:------------------:|:------:|:-----------:|
|Gimnasio|`instalaciones_ts`|Almacenar registros de sitio fisico y digital del gimnasio.|`bigfile`<br>`10M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`u01/app/oracle/oradata/ELROPROY/disk06/instalaciones_df.dbf`|
|Gimnasio|`inventario_ts`|Almacenar registros de estado de dispositivo.|`bigfile`<br>`50M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`u01/app/oracle/oradata/ELROPROY/disk07/inventario_df.dbf`|
|Gimnasio|`empleados_ts`|Almacenar registros de la organizacion.|`bigfile`<br>`10M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`u01/app/oracle/oradata/ELROPROY/disk08/empleados_df.dbf`|
|Gimnasio|`huellas_ts`|Optimizar consultas a tabla EMPLEADO.|`bigfile`<br>`50M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`u01/app/oracle/oradata/ELROPROY/disk09/huellas_df.dbf`|
|Cliente|`clientes_ts`|Almacenar registros de usuario.|`bigfile`<br>`10M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`u01/app/oracle/oradata/ELROPROY/disk10/clientes_df.dbf`|
|Cliente|`sesiones_ts`|Almacenar registros de actividad de usuario.|`bigfile`<br>`50M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`u01/app/oracle/oradata/ELROPROY/disk11/sesiones_df.dbf`|
|Cliente|`historial_ts`|Almacenar registros históricos de usuario.|`smallfile`<br>`100M`<br>`extend management local autoallocate`<br>`segment space management auto`<br>`u01/app/oracle/oradata/ELROPROY/disk12/historial01_df.dbf`, `u01/app/oracle/oradata/ELROPROY/disk13/historial02_df.dbf`|

### Asignación de tablespace por objeto y módulo
|Módulo|Tipo de segmento|Nombre de segmento|Nombre de tablespace|
|:----:|:--------------:|:----------------:|:------------------:|
|Gimnasio|Tabla|`PUESTO`|`empleados_ts`|
|Gimnasio|Índice|`puesto_pk`|`indices_ts`|
|Gimnasio|Tabla|`EMPLEADO`|`empleados_ts`|
|Gimnasio|Índice|`empleado_pk`|`indices_ts`|
|Gimnasio|Índice|`empleado_puesto_id_ix`|`indices_ts`|
|Gimnasio|Índice|`empleado_foto_blob_ix`|`empleados_ts`|
|Gimnasio|Columna|`empleado_foto`|`blob_ts`|
|Gimnasio|Tabla|`ADMINISTRADOR`|`empleados_ts`|
|Gimnasio|Índice|`administrador_pk`|`indices_ts`|
|Gimnasio|Índice|`administrador_certificado_blob_ix`|`empleados_ts`|
|Gimnasio|Columna|`administrador_certificado`|`blob_ts`|
|Gimnasio|Tabla|`INSTRUCTOR`|`empleados_ts`|
|Gimnasio|Índice|`instructor_pk`|`indices_ts`|
|Cliente|Tabla|`CLIENTE`|`clientes_ts`|
|Cliente|Índice|`cliente_pk`|`indices_ts`|
|Cliente|Índice|`cliente_foto_blob_ix`|`clientes_ts`|
|Cliente|Columna|`cliente_foto`|`blob_ts`|
|Gimnasio|Tabla|`GIMNASIO`|`instalaciones_ts`|
|Gimnasio|Índice|`gimnasio_pk`|`indices_ts`|
|Gimnasio|Tabla|`SALA`|`instalaciones_ts`|
|Gimnasio|índice|`sala_pk`|`indices_ts`|
|Gimnasio|Índice|`sala_gimnasio_id_ix`|`indices_ix`|
|Gimnasio|Índice|`sala_emp_admin_id_ix`|`indices_ix`|
|Cliente|Tabla|`SESION`|`sesiones_ts`|
|Cliente|Índice|`sesion_pk`|`indices_ts`|
|Cliente|Índice|`sesion_emp_inst_id_ix`|`indices_ts`|
|Cliente|Índice|`sesion_cliente_id_ix`|`indices_ts`|
|Cliente|Índice|`sesion_sala_id_ix`|`indices_ts`|
|Cliente|Tabla|`BITACORA`|`historial_ts`|
|Cliente|Índice|`bitacora_pk`|`indices_ts`|
|Cliente|Índice|`bitacora_sesion_id_ix`|`indice_ts`|
|Cliente|Tabla|`CREDENCIAL`|`clientes_ts`|
|Cliente|Índice|`credencial_pk`|`indices_ts`|
|Gimnasio|Tabla|`DISCIPLINA`|`instalaciones_ts`|
|Gimnasio|Índice|`disciplina_pk`|`indices_ts`|
|Gimnasio|Columna|`disciplina_icono_blob_ix`|`instalaciones_ts`|
|Gimnasio|Columna|`disciplina_icono`|`blob_ts`|
|Gimnasio|Tabla|`STATUS`|`inventario_ts`|
|Gimnasio|Índice|`status_pk`|`indices_ts`|
|Gimnasio|Tabla|`TIPO_DISPOSITIVO`|`inventario_ts`|
|Gimnasio|Índice|`tipo_dispositivo_pk`|`indices_ts`|
|Gimnasio|Tabla|`DISPOSITIVO`|`inventario_ts`|
|Gimnasio|Índice|`dispositivo_pk`|`indices_ts`|
|Gimnasio|Índice|`dispositivo_tipo_id_ix`|`indices_ts`|
|Gimnasio|Índice|`dispositivo_sala_id_ix`|`indices_ts`|
|Gimnasio|Índice|`dispositivo_status_id_ix`|`indices_ts`|
|Gimnasio|Tabla|`HUELLA`|`huellas_ts`|
|Gimnasio|índice|`huella_pk`|`indices_ts`|
|Gimnasio|índice|`huella0_blob_ix`|`huellas_ts`|
|Gimnasio|índice|`huella1_blob_ix`|`huellas_ts`|
|Gimnasio|índice|`huella2_blob_ix`|`huellas_ts`|
|Gimnasio|índice|`huella3_blob_ix`|`huellas_ts`|
|Gimnasio|índice|`huella4_blob_ix`|`huellas_ts`|
|Gimnasio|índice|`huella5_blob_ix`|`huellas_ts`|
|Gimnasio|índice|`huella6_blob_ix`|`huellas_ts`|
|Gimnasio|índice|`huella7_blob_ix`|`huellas_ts`|
|Gimnasio|índice|`huella8_blob_ix`|`huellas_ts`|
|Gimnasio|índice|`huella9_blob_ix`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella0`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella1`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella2`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella3`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella4`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella5`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella6`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella7`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella8`|`huellas_ts`|
|Gimnasio|Columna|`huella_huella9`|`huellas_ts`|
|Gimnasio|Tabla|`INSTRUCTOR_WEB`|`empleados_ts`|
|Gimnasio|Índice|`instructor_web_pk`|`indices_ts`|
|Gimnasio|Tabla|`MULTIMEDIA`|`instalaciones_ts`|
|Gimnasio|Índice|`multimedia_pk`|`indices_ts`|
|Gimnasio|Índice|`multimedia_gimnasio_id_ix`|`indices_ts`|
|Gimnasio|índice|`multimedia_contenido_blob_ix`|`instalaciones_ts`|
|Gimnasio|Columna|`multimedia_contenido`|`blob_ts`|
|Cliente|Tabla|`REPORTE`|`historial_ts`|
|Cliente|Índice|`reporte_pk`|`indices_ts`|
|Cliente|Índice|`reporte_cliente_id_ix`|`indicse_ts`|
|Gimnasio|Tabla|`SALA_DISCIPLINA`|`instalaciones_ts`|
|Gimnasio|Índice|`sala_disciplina_pk`|`indices_ts`|
|Gimnasio|Índice|`sala_disciplina_sala_id_ix`|`indices_ts`|
|Gimnasio|Índice|`sala_disciplina_id_ix`|`indices_ts`|
|Cliente|Tabla|`SENSOR`|`clientes_ts`|
|Cliente|Índice|`sensor_pk`|`indices_ts`|
|Cliente|Índice|`sensor_cliente_id_ix`|`indices_ts`|
|Cliente|Tabla|`SESION_DISPOSITIVO`|`sesiones_ts`|
|Cliente|Índice|`sesion_dispositivo_pk`|`indices_ts`|
|Cliente|Índice|`sesion_dispositivo_sesion_id_ix`|`indice_ts`|
|Cliente|Índice|`sesion_dispositivo_dispositivo_id_ix`|`indice_ts`|
|Gimnasio|Tabla|`STATUS_DISPOSITIVO`|`inventario_ts`|
|Gimnasio|Índice|`status_dispositivo_pk`|`indices_ts`|
|Gimnasio|Índice|`status_dispositivo_dispositivo_id_ix`|`indice_ts`|
|Gimnasio|Índice|`status_dispositivo_status_id_ix`|`indice_ts`|


## Creación de usuarios

|Nombre de usuario|Default tablespace|Default temporary tablespace|Default undo tablespace|Privilegios asignados|
|:---------------:|:----------------:|:--------------------------:|:---------------------:|:-------------------:|
|`gimnasio01`|`gimnasios_ts`|`temp_ts`|`undo_ts`|`create session`<br>`create table`<br>`create sequence`<br>`create procedure`<br>`create trigger`<br>`create synonym`<br>`create view`|
|`cliente01`|`clientes_ts`|`temp_ts`|`undo_ts`|`create session`<br>`create table`<br>`create sequence`<br>`create procedure`<br>`create trigger`<br>`create synonym`<br>`create view`|


## Programa de respaldos

|Fecha y hora|Datos REDO producidos|Fecha de respaldo|Tipo de backup|Espaldos requerido por el backup|
|:----------:|:-------------------:|:---------------:|:------------:|:------------------------------:|
|`04-06-2022 15:00:00`|`0M`|`04-06-2022`|Incremental Nivel 0|`595.1M`|
|`05-06-2022 15:00:00`|`80M`|`05-06-2022`|Diferencial Nivel 1|`111.3M`|
|`05-06-2022 23:00:00`|`7M`|`05-06-2022`|Diferencial Nivel 1|`8.7M`|
|`05-06-2022 23:10:00`|`4.1M`|`05-06-2022`|Cumulativo Nivel 1|`115.4M`|
|`06-06-2022 19:10:00`|`18.4M`|`06-06-2022`|Diferencial Nivel 1|`21.8M`|
|`07-06-2022 00:07:00`|`49.5M`|`06-06-2022`|Diferencial Nivel 1|`34.2M`|
|`07-06-2022 00:17:00`|`0.1M`|`06-06-2022`|Cumulativo Nivel 1|`120.4M`|
|`07-06-2022 15:08:00`|`15M`|`07-06-2022`|Diferencial Nivel 1|`18.1M`|
|`07-06-2022 23:12:00`|`71.8M`|`07-06-2022`|Diferencial Nivel 1|`69.5M`|
|`07-06-2022 23:16:00`|`0.1M`|`07-06-2022`|Cumulativo Nivel 1|`141.1M`|
|`08-06-2022 15:18:00`|`42.2M`|`08-06-2022`|Diferencial Nivel 1|`33M`|
|`09-06-2022 00:16:00`|`24.2M`|`08-06-2022`|Diferencial Nivel 1|`28.2M`|
|`09-06-2022 00:23:00`|`39.6M`|`08-06-2022`|Cumulativo Nivel 1|`153.4M`|
|`09-06-2022 12:28:00`|`22.1M`|`09-06-2022`|Diferencial Nivel 1|`33M`|
|09-06-2022 00:16:00|24.2M|08-06-2022|Diferencial Nivel 1|28.2M|
|09-06-2022 00:23:00|39.6M|08-06-2022|Cumulativo Nivel 1|153.4M|
