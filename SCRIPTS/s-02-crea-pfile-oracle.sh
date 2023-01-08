#!/bin/bash

# @Integrantes:
#               -Elizarraras Herrera Carlos Amador
#               -Rocha García Erick Hazel
# @Fecha        11/05/2022
# @Descripcion  Crea archivo PFILE.

echo "Creando un archivo de parámetros básico"
export ORACLE_SID=elroproy
pfile=$ORACLE_HOME/dbs/init${ORACLE_SID}.ora
if [ -f "${pfile}" ]; then
read -p "El archivo ${pfile} ya existe, [enter] para sobrescribir"
fi;
echo \
"db_name='${ORACLE_SID}'
memory_target=1G
control_files=
(
  /unam-bd/d01/app/oracle/oradata/${ORACLE_SID^^}/control01.ctl,
  /unam-bd/d02/app/oracle/oradata/${ORACLE_SID^^}/control02.ctl,
  /unam-bd/d03/app/oracle/oradata/${ORACLE_SID^^}/control03.ctl
)">$pfile
echo "Listo"
echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat ${pfile}