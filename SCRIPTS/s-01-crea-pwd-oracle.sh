#!/bin/bash

# @Integrantes:
#               -Elizarraras Herrera Carlos Amador
#               -Rocha García Erick Hazel
# @Fecha        11/05/2022
# @Descripcion  Crea archivo de passwords.

export ORACLE_SID=elroproy

echo "Generando nuevo orapw${ORACLE_SID}"
orapwd FILE='${ORACLE_HOME}/dbs/orapw${ORACLE_SID}' FORCE=Y FORMAT=12.2 \
SYS="hola1234*"
SYSBACKUP="sysbackup"
echo "Verificando nuevo orapw${ORACLE_SID}"
ls -l ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}