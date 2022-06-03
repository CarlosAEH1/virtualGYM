#!/bin/bash

# @Integrantes:
#               -Elizarraras Herrera Carlos Amador
#               -Rocha García Erick Hazel
# @Fecha        11/05/2022
# @Descripcion  Crea directorios para modo archivelog.

echo "Creando directorios para modo archivelog"
export ORACLE_SID=elroproy
cd /unam-bd
mkdir archivelogs
chown oracle:oinstall archivelogs
chmod 750 archivelogs
cd archivelogs
mkdir ${ORACLE_SID^^}
chown oracle:oinstall ${ORACLE_SID^^}
chmod 750 ${ORACLE_SID^^}
cd ${ORACLE_SID^^}
mkdir disk_a
chown oracle:oinstall disk_a
chmod 750 disk_a