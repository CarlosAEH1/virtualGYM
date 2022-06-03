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
show spparameter db_domain
alter system set db_domain='fi.unam' scope=spfile;
show spparameter db_domain

Prompt Reiniciando
shutdown
startup

Prompt Conectando como usuario SYS
connect sys/system as sysdba

show spparameter db_domain

Promp Habilitando modo compartido para 1 dispatcher cada 20 conexiones.
show spparameter dispatchers
alter system set dispatchers='(dispatchers=2)(protocol=tcp)' scope=both;
show spparameter dispatchers
show spparameter shared_servers
alter system set shared_servers=40 scope=both;
show spparameter shared_servers

Prompt Actualizando configuración de listener
alter system register;

Prompt Listo
exit