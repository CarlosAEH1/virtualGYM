--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       11/05/2022
--@Descripcion: Crea diccionario de datos.

connect sys/system as sysdba

@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

connect system/system

@?/sqlplus/admin/pupbld.sql