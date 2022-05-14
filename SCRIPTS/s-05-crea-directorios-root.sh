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
cd ${ORACLE_SID^^}
mkdir disk00
chown oracle:oinstall disk00
chmod 750 disk00
cd disk00
mkdir disk000
chown oracle:oinstall disk000
chmod 750 disk000
mkdir disk001
chown oracle:oinstall disk001
chmod 750 disk001
cd ..
mkdir disk01
chown oracle:oinstall disk01
chmod 750 disk01
mkdir disk02
chown oracle:oinstall disk02
chmod 750 disk02
mkdir disk03
chown oracle:oinstall disk03
chmod 750 disk03
mkdir disk04
chown oracle:oinstall disk04
chmod 750 disk04
mkdir disk05
chown oracle:oinstall disk05
chmod 750 disk05
mkdir disk06
chown oracle:oinstall disk06
chmod 750 disk06
mkdir disk07
chown oracle:oinstall disk07
chmod 750 disk07
mkdir disk08
chown oracle:oinstall disk08
chmod 750 disk08
mkdir disk09
chown oracle:oinstall disk09
chmod 750 disk09
mkdir disk10
chown oracle:oinstall disk10
chmod 750 disk10
mkdir disk11
chown oracle:oinstall disk11
chmod 750 disk11
mkdir disk12
chown oracle:oinstall disk12
chmod 750 disk12
mkdir disk13
chown oracle:oinstall disk13
chmod 750 disk13

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