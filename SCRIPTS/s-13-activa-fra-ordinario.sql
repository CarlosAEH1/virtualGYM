--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       02/06/2022
--@Descripcion: Activa FRA

Prompt Conectando como usuario SYS
connect sys/system as sysdba

Prompt Respaldando spfile.
create pfile from spfile;

Prompt Configurando archivo de parametros.
--Tamaño estimado para FRA.
show spparameters db_recovery_file_dest_size
alter system set db_recovery_file_dest_size=15G scope=both;
show spparameters db_recovery_file_dest_size
--Ruta de FRA.
show spparameters db_recovery_file_dest
alter system set db_recovery_file_dest='/unam-bd/fast-reco-area' scope=both;
show spparameters db_recovery_file_dest
--Coerficiente de retención.
show spparameters db_flashback_retention_target
alter system set db_flashback_retention_target=1440 scope=both;
show spparameters db_flashback_retention_target

Prompt Listo
exit