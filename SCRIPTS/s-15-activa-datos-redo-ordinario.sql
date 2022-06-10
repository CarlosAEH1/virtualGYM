--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       14/05/2022
--@Descripcion: Activa produccion de datos REDO.

Prompt Conectando como usuario SYS
connect sys/system as sysdba

Prompt Activando produccion de datos REDO en tablespaces.
alter tablespace indices_ts logging;
alter tablespace blob_indices_ts logging;
alter tablespace blob_ts logging;
alter tablespace instalaciones_ts logging;
alter tablespace inventario_ts logging;
alter tablespace empleados_ts logging;
alter tablespace huellas_ts logging;
alter tablespace clientes_ts logging;
alter tablespace sesiones_ts logging;
alter tablespace historial_ts logging;

Prompt Listo
exit