--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       11/05/2022
--@Descripcion: Crea archivo SPFILE.

Prompt Inicializando ORACLE_SID
!export ORACLE_SID=elroproy

connect sys/hola1234* as sysdba

Prompt Creando archivo binario.
create spfile from pfile;

Prompt Verificando creación de SPFILE.
!ls ${ORACLE_HOME}/dbs/spfile${ORACLE_SID}.ora