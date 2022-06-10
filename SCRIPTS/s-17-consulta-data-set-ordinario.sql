--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       14/05/2022
--@Descripcion: Consulta de data set.

Prompt Conectando como usuario SYS
connect sys/system as sysdba

Prompt Consultando data set de backup con tag determinado.
select session_key, bs_key, set_count, handle, tag
from v$backup_piece_details
where tag='backup_nivel_0';
select
session_key,
bs_key,
status,
start_time,
completion_time,
trunc(elapsed_seconds, 0),
elapsed_seconds,
deleted,
size_bytes_display
from v$backup_piece_details
where tag='backup_nivel_0';