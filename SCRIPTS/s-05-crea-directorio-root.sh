#!/bin/bash

# @Integrantes:
#               -Elizarraras Herrera Carlos Amador
#               -Rocha García Erick Hazel
# @Fecha        11/05/2022
# @Descripcion  Crea directorios para nueva base de datos.

echo "Creando directorios para data files"
export ORACLE_SID=elroproy
cd /u01/app/oracle/oradata
mkdir ${ORACLE_SID^^}
chown oracle:oinstall ${ORACLE_SID^^}
chmod 750 ${ORACLE_SID^^}

echo "Mostrando directorio de data files"
ls -l /u01/app/oracle/oradata

echo "Creando directorios para Redo Log y control files"
cd /unam-bda/d01
mkdir -p app/oracle/oradata/${ORACLE_SID^^}
chown -R oracle:oinstall app
chmod -R 750 app
cd /unam-bda/d02
mkdir -p app/oracle/oradata/${ORACLE_SID^^}
chown -R oracle:oinstall app
chmod -R 750 app
cd /unam-bda/d03
mkdir -p app/oracle/oradata/${ORACLE_SID^^}
chown -R oracle:oinstall app
chmod -R 750 app

echo "Mostrando directorios para control files y Redo Logs"
ls -l /unam-bda/d0*/app/oracle/oradata