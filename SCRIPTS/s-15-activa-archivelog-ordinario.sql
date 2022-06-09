--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       02/06/2022
--@Descripcion: Activa modo archivelog.

Prompt Conectando como usuario SYS.
connect sys/system as sysdba

Prompt Respaldando spfile.
create pfile from spfile;

Prompt Configurando archivo de parametros.
--Cantidad de procesos ARCn.
show spparameters log_archive_max_processes
alter system set log_archive_max_processes=5 scope=spfile;
show spparameters log_archive_max_processes
--Directorio de copia de archivado 1 (obligatoria).
show spparameters log_archive_dest_1
alter system set
log_archive_dest_1='LOCATION=/unam-bd/archivelogs/ELROPROY/disk_a MANDATORY'
scope=spfile;
show spparameters log_archive_dest_1
--Directorio de copia de archivado 2.
Prompt Configurando copia de archived_redo logs a FRA.
show spparameters log_archive_dest_2
alter system set log_archive_dest_2='LOCATION=USE_DB_RECOVERY_FILE_DEST'
scope=both;
show spparameters log_archive_dest_2
--Formato de nombre de archivos.
show spparameters log_archive_format
alter system set log_archive_format='arch_%t_%s_%r.arc' scope=spfile;
show spparameters log_archive_format
--Cantidad de copias exitosas.
show spparameters log_archive_min_succeed_dest
alter system set log_archive_min_succeed_dest=1 scope=spfile;
show spparameters log_archive_min_succeed_dest

Prompt Iniciando instancia en modo mount
shutdown
startup mount

Prompt Activando modo archivelog
alter database archivelog;
alter database open;

Prompt Verificando estado de modo archivelog
archive log list

Prompt Respaldando spfile.
create pfile from spfile;

Prompt Listo
exit