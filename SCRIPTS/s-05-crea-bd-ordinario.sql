--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       11/05/2022
--@Descripcion: Crea base de datos.

Prompt Inicializando ORACLE_SID
!export ORACLE_SID=elroproy

connect sys/hola1234* as sysdba

Prompt Iniciando instancia en modo nomount.
startup nomount

whenever sqlerror exit rollback

create database elroproy
  user sys identified by system
  user system identified by system
  logfile
  group 1
  (
    '/unam-bd/d01/app/oracle/oradata/ELROPROY/redo01a.log',
    '/unam-bd/d02/app/oracle/oradata/ELROPROY/redo01b.log',
    '/unam-bd/d03/app/oracle/oradata/ELROPROY/redo01c.log'
  ) size 50m blocksize 512,
  group 2
  (
    '/unam-bd/d01/app/oracle/oradata/ELROPROY/redo02a.log',
    '/unam-bd/d02/app/oracle/oradata/ELROPROY/redo02b.log',
    '/unam-bd/d03/app/oracle/oradata/ELROPROY/redo02c.log'
  ) size 50m blocksize 512,
  group 3
  (
    '/unam-bd/d01/app/oracle/oradata/ELROPROY/redo03a.log',
    '/unam-bd/d02/app/oracle/oradata/ELROPROY/redo03b.log',
    '/unam-bd/d03/app/oracle/oradata/ELROPROY/redo03c.log'
  ) size 50m blocksize 512
  maxloghistory 1
  maxlogfiles 16
  maxlogmembers 3
  maxdatafiles 1024
  character set AL32UTF8
  national character set AL16UTF16
  extent management local
  datafile '/u01/app/oracle/oradata/ELROPROY/system01.dbf'
    size 700m reuse autoextend on next 10240k maxsize unlimited
  sysaux datafile '/u01/app/oracle/oradata/ELROPROY/sysaux01.dbf'
    size 550m reuse autoextend on next 10240k maxsize unlimited
  default tablespace users
    datafile '/u01/app/oracle/oradata/ELROPROY/users01.dbf'
    size 500m reuse autoextend on maxsize unlimited
  default temporary tablespace tempts1
    tempfile '/u01/app/oracle/oradata/ELROPROY/temp01.dbf'
    size 20m reuse autoextend on next 640k maxsize unlimited
  undo tablespace undotbs1
    datafile '/u01/app/oracle/oradata/ELROPROY/undotbs01.dbf'
    size 200m reuse autoextend on next 5120k maxsize unlimited;

alter user sys identified by system;
alter user system identified by system;