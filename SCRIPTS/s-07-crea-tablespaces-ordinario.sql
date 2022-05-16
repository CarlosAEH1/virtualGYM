--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       14/05/2022
--@Descripcion: Crea tablespaces.

connect sys/system as sysdba

create undo tablespace undo_ts
datafile '/u01/app/oracle/oradata/ELROPROY/disk00/undo_df.dbf'
size 10M autoextend on retention guarantee;

create temporary tablespace temp_ts
tempfile '/u01/app/oracle/oradata/ELROPROY/disk01/temp_df.dbf' size 20M;

alter database default temporary tablespace temp_ts;

create tablespace indices_ts
datafile '/u01/app/oracle/oradata/ELROPROY/disk02/indices_df.dbf'
size 50M autoextend on next 50M maxsize 500M
extent management local autoallocate
segment space management auto;

create tablespace blob_indices_ts
datafile '/u01/app/oracle/oradata/ELROPROY/disk03/indices_df.dbf'
size 50M autoextend on next 50M maxsize 500M
extent management local autoallocate
segment space management auto;

create tablespace blob_ts
datafile
'/u01/app/oracle/oradata/ELROPROY/disk04/blob01_df.dbf'
size 50M autoextend on next 50M maxsize 1G,
'/u01/app/oracle/oradata/ELROPROY/disk05/blob02_df.dbf'
size 50M autoextend on next 50M maxsize 1G
extent management local autoallocate
segment space management auto;

create tablespace instalaciones_ts
datafile '/u01/app/oracle/oradata/ELROPROY/disk06/instalaciones_df.dbf'
size 10M autoextend on next 10M maxsize 500M
extent management local autoallocate
segment space management auto;

create tablespace inventario_ts
datafile '/u01/app/oracle/oradata/ELROPROY/disk07/inventario_df.dbf'
size 50M autoextend on next 50M maxsize 500M
extent management local autoallocate
segment space management auto;

create tablespace empleados_ts
datafile '/u01/app/oracle/oradata/ELROPROY/disk08/empleados_df.dbf'
size 10M autoextend on next 10M maxsize 500M
extent management local autoallocate
segment space management auto;

create tablespace huellas_ts
datafile '/u01/app/oracle/oradata/ELROPROY/disk09/huellas_df.dbf'
size 50M autoextend on next 50M maxsize 500M
extent management local autoallocate
segment space management auto;

create tablespace clientes_ts
datafile '/u01/app/oracle/oradata/ELROPROY/disk10/clientes_df.dbf'
size 10M autoextend on next 10M maxsize 500M
extent management local autoallocate
segment space management auto;

create tablespace sesiones_ts
datafile '/u01/app/oracle/oradata/ELROPROY/disk11/sesiones_df.dbf'
size 50M autoextend on next 50M maxsize 500M
extent management local autoallocate
segment space management auto;

create tablespace historial_ts
datafile
'/u01/app/oracle/oradata/ELROPROY/disk12/historial01_df.dbf'
size 50M autoextend on next 50M maxsize 1G,
'/u01/app/oracle/oradata/ELROPROY/disk13/historial02_df.dbf'
size 50M autoextend on next 50M maxsize 1G
extent management local autoallocate
segment space management auto;

Prompt Listo
exit