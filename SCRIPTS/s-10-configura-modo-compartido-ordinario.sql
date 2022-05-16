--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       15/05/2022
--@Descripcion: Configura modo compartido

--Activar modo compartido, agregando datos de archivo RECURSOS/tnsnames.txt
--en $ORACLE_HOME/network/admin/tnsnames.ora

Prompt Conectando como usuario SYS
connect sys/system as sysdba

Prompt Asignando valor a db_domain
show parameter db_domain;
alter system set db_domain='fi.unam' scope=spfile;
show parameter db_domain;

Prompt Reiniciando
shutdown
startup

Prompt Conectando como usuario SYS
connect sys/system as sysdba

show parameter db_domain;

Promp Habilitando modo compartido para poco más de 2000 conexiones.
show parameter dispatchers
alter system set dispatchers='(dispatchers=10)(protocol=tcp)' scope=memory;
show parameter dispatchers
show parameter shared_servers
alter system set shared_servers=25 scope=memory;
show parameter shared_servers

Prompt Actualizando configuración de listener
alter system register;

Prompt Listo
exit