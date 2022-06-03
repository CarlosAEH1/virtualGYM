--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       02/06/2022
--@Descripcion: Configura modo compartido

--Activar poool de conexiones, agregando datos de archivo RECURSOS/tnsnames.txt
--en $ORACLE_HOME/network/admin/tnsnames.ora

Prompt Conectando como usuario SYS
connect sys/system as sysdba

Prompt Iniciando nuevo connection pool
exec dbms_connection_pool.start_pool();

Prompt Configurando rango de conexiones
exec dbms_connection_pool.alter_param ('','MAXSIZE','50');
exec dbms_connection_pool.alter_param ('','MINSIZE','40');

Prompt Configurando limite de tiempo
--Tienmpo máximo de inactividad en una conexión no asignada a usuario.
exec dbms_connection_pool.alter_param ('','INACTIVITY_TIMEOUT','1800');
--Tiempo máximo de inactividad en una conexión asignada a usuario
exec dbms_connection_pool.alter_param ('','MAX_THINK_TIME','1800');