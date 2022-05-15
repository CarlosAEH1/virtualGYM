--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       14/05/2022
--@Descripcion: Crea usuarios y otorga permisos

Prompt Conectando como usuario SYS
connect sys/system as sysdba

Prompt Creando rol y usuarios
whenever sqlerror exit rollback;

declare
v_count number;
v_role varchar2(20):='ADMINISTRACION';
v_username1 varchar2(20):='GIMNASIO01';
v_username2 varchar2(20):='CLIENTE01';
begin
select count(*) into v_count from dba_roles where role=v_role;
if v_count >0 then execute immediate 'drop role '||v_role;
end if;
select count(*) into v_count from all_users where username=v_username1;
if v_count >0 then execute immediate 'drop user '||v_username1||' cascade';
end if;
select count(*) into v_count from all_users where username=v_username2;
if v_count >0 then execute immediate 'drop user '||v_username2||' cascade';
end if;
end;
/

create role administracion;

grant
create session,
create table,
create sequence,
create procedure,
create trigger,
create synonym,
create view
to administracion;

create user gimnasio01 identified by gimnasio
default tablespace instalaciones_ts
quota unlimited on instalaciones_ts
quota unlimited on salas_ts
quota unlimited on inventario_ts
quota unlimited on empleados_ts
quota unlimited on huellas_ts
quota unlimited on blob_ts
quota unlimited on indices_ts;

grant administracion to gimnasio01;

create user cliente01 identified by cliente
default tablespace clientes_ts
quota unlimited on clientes_ts
quota unlimited on sesiones_ts
quota unlimited on historial_ts
quota unlimited on blob_ts
quota unlimited on indices_ts;

grant administracion to cliente01;

Prompt Listo
exit