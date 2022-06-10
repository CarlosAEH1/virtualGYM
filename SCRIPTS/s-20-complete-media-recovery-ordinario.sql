--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       14/05/2022
--@Descripcion: Ejecuta complete media recovery.

Prompt Conectando como usuario SYS
connect sys/system as sysdba

Promp Ejecutando complete media recovery.
shutdown abort;
startup mount;
restore database;
recover database;
alter database open resetlogs;