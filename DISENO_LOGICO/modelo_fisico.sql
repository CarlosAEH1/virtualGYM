---- ER/Studio 8.0 SQL Code Generation-- Company :      UNAM-- Project :      GYM_virtual.DM1-- Author :       carlos_amador1@comunidad.unam.mx---- Date Created : Wednesday, May 11, 2022 02:30:28-- Target DBMS : Oracle 11g---- -- TABLE: PUESTO --CREATE TABLE PUESTO(    PUESTO_ID      NUMBER(10, 0)     NOT NULL,    NOMBRE         VARCHAR2(40)      NOT NULL,    CLAVE          VARCHAR2(10)      NOT NULL,    DESCRIPCION    VARCHAR2(4000)    NOT NULL,    CONSTRAINT PK3 PRIMARY KEY (PUESTO_ID));-- -- TABLE: EMPLEADO --CREATE TABLE EMPLEADO(    EMPLEADO_ID         NUMBER(10, 0)    NOT NULL,    NOMBRE              VARCHAR2(40)     NOT NULL,    AP_PAT              VARCHAR2(40)     NOT NULL,    AP_MAT              VARCHAR2(40),    CURP                VARCHAR2(18)     NOT NULL,    NUM_TRABAJADOR      NUMBER(10, 0)    NOT NULL,    RFC                 VARCHAR2(15)     NOT NULL,    FECHA_NACIMIENTO    DATE             NOT NULL,    EMAIL               VARCHAR2(40)     NOT NULL,    FOTO                BLOB             NOT NULL,    TIPO                CHAR(1)          NOT NULL,    PUESTO_ID           NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK2 PRIMARY KEY (EMPLEADO_ID),     CONSTRAINT RefPUESTO22 FOREIGN KEY (PUESTO_ID)    REFERENCES PUESTO(PUESTO_ID));-- -- TABLE: ADMINISTRADOR --CREATE TABLE ADMINISTRADOR(    EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,    USERNAME       VARCHAR2(40)     NOT NULL,    PASSWORD       VARCHAR2(40)     NOT NULL,    ROL            VARCHAR2(40)     NOT NULL,    CERTIFICADO    BLOB             NOT NULL,    CONSTRAINT PK4 PRIMARY KEY (EMPLEADO_ID),     CONSTRAINT RefEMPLEADO26 FOREIGN KEY (EMPLEADO_ID)    REFERENCES EMPLEADO(EMPLEADO_ID));-- -- TABLE: CLIENTE --CREATE TABLE CLIENTE(    CLIENTE_ID          NUMBER(10, 0)     NOT NULL,    NOMBRE              VARCHAR2(40)      NOT NULL,    AP_PAT              VARCHAR2(40)      NOT NULL,    AP_MAT              VARCHAR2(40),    EMAIL               VARCHAR2(40)      NOT NULL,    USERNAME            VARCHAR2(40)      NOT NULL,    PASSWORD            VARCHAR2(40)      NOT NULL,    DIRECCION           VARCHAR2(4000)    NOT NULL,    FECHA_NACIMIENTO    DATE              NOT NULL,    CURP                VARCHAR2(18)      NOT NULL,    FOTO                BLOB              NOT NULL,    CONSTRAINT PK9 PRIMARY KEY (CLIENTE_ID));-- -- TABLE: CREDENCIAL --CREATE TABLE CREDENCIAL(    CLIENTE_ID       NUMBER(10, 0)    NOT NULL,    FOLIO            VARCHAR2(8)      NOT NULL,    VIGENCIA         DATE             NOT NULL,    CODIGO_BARRAS    NUMBER(13, 0)    NOT NULL,    CONSTRAINT PK10 PRIMARY KEY (CLIENTE_ID),     CONSTRAINT RefCLIENTE33 FOREIGN KEY (CLIENTE_ID)    REFERENCES CLIENTE(CLIENTE_ID));-- -- TABLE: DISCIPLINA --CREATE TABLE DISCIPLINA(    DISCIPLINA_ID    NUMBER(10, 0)     NOT NULL,    CLAVE            VARCHAR2(10)      NOT NULL,    NOMBRE           VARCHAR2(40)      NOT NULL,    DESCRIPCION      VARCHAR2(4000)    NOT NULL,    ICONO            BLOB              NOT NULL,    CONSTRAINT PK7 PRIMARY KEY (DISCIPLINA_ID));-- -- TABLE: GIMNASIO --CREATE TABLE GIMNASIO(    GIMNASIO_ID     NUMBER(10, 0)     NOT NULL,    FOLIO           VARCHAR2(5)       NOT NULL,    NOMBRE          VARCHAR2(40)      NOT NULL,    CALLE           VARCHAR2(40)      NOT NULL,    NUM_INTERIOR    NUMBER(3, 0)      NOT NULL,    NUM_EXTERIOR    NUMBER(3, 0)      NOT NULL,    COLONIA         VARCHAR2(40)      NOT NULL,    COD_POSTAL      NUMBER(5, 0)      NOT NULL,    DELEGACION      VARCHAR2(40)      NOT NULL,    ESTADO          VARCHAR2(40)      NOT NULL,    LATITUD         NUMBER(10, 15)    NOT NULL,    LONGITUD        NUMBER(10, 15)    NOT NULL,    TELEFONO        VARCHAR2(13)      NOT NULL,    URL             VARCHAR2(4000)    NOT NULL,    GERENTE_ID      NUMBER(10, 0)     NOT NULL,    CONSTRAINT PK1 PRIMARY KEY (GIMNASIO_ID),     CONSTRAINT RefEMPLEADO49 FOREIGN KEY (GERENTE_ID)    REFERENCES EMPLEADO(EMPLEADO_ID));-- -- TABLE: SALA --CREATE TABLE SALA(    SALA_ID         NUMBER(10, 0)    NOT NULL,    CLAVE           VARCHAR2(3)      NOT NULL,    NOMBRE          VARCHAR2(40)     NOT NULL,    CAPACIDAD       NUMBER(10, 0)    NOT NULL,    GIMNASIO_ID     NUMBER(10, 0)    NOT NULL,    EMP_ADMIN_ID    NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK6 PRIMARY KEY (SALA_ID),     CONSTRAINT RefGIMNASIO20 FOREIGN KEY (GIMNASIO_ID)    REFERENCES GIMNASIO(GIMNASIO_ID),    CONSTRAINT RefADMINISTRADOR23 FOREIGN KEY (EMP_ADMIN_ID)    REFERENCES ADMINISTRADOR(EMPLEADO_ID));-- -- TABLE: TIPO_DISPOSITIVO --CREATE TABLE TIPO_DISPOSITIVO(    TIPO_DISPOSITIVO_ID    NUMBER(10, 0)     NOT NULL,    NOMBRE                 VARCHAR2(40)      NOT NULL,    DESCRIPCION            VARCHAR2(4000)    NOT NULL,    CONSTRAINT PK21 PRIMARY KEY (TIPO_DISPOSITIVO_ID));-- -- TABLE: STATUS --CREATE TABLE STATUS(    STATUS_ID    NUMBER(10, 0)    NOT NULL,    NOMBRE       VARCHAR2(15)     NOT NULL,    CONSTRAINT PK24 PRIMARY KEY (STATUS_ID));-- -- TABLE: DISPOSITIVO --CREATE TABLE DISPOSITIVO(    DISPOSITIVO_ID         NUMBER(10, 0)    NOT NULL,    NUMERO_INVENTARIO      VARCHAR2(18)     NOT NULL,    FECHA_ADQUISION        DATE             NOT NULL,    TIPO_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,    SALA_ID                NUMBER(10, 0)    NOT NULL,    STATUS_ID              NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK8 PRIMARY KEY (DISPOSITIVO_ID),     CONSTRAINT RefSALA29 FOREIGN KEY (SALA_ID)    REFERENCES SALA(SALA_ID),    CONSTRAINT RefTIPO_DISPOSITIVO32 FOREIGN KEY (TIPO_DISPOSITIVO_ID)    REFERENCES TIPO_DISPOSITIVO(TIPO_DISPOSITIVO_ID),    CONSTRAINT RefSTATUS52 FOREIGN KEY (STATUS_ID)    REFERENCES STATUS(STATUS_ID));-- -- TABLE: HUELLA --CREATE TABLE HUELLA(    EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,    HUELLA         BLOB             NOT NULL,    HUELLA1        BLOB             NOT NULL,    HUELLA2        BLOB             NOT NULL,    HUELLA3        BLOB             NOT NULL,    HUELLA4        BLOB             NOT NULL,    HUELLA5        BLOB             NOT NULL,    HUELLA6        BLOB             NOT NULL,    HUELLA7        BLOB             NOT NULL,    HUELLA8        BLOB             NOT NULL,    HUELLA9        BLOB             NOT NULL,    CONSTRAINT PK31 PRIMARY KEY (EMPLEADO_ID),     CONSTRAINT RefEMPLEADO50 FOREIGN KEY (EMPLEADO_ID)    REFERENCES EMPLEADO(EMPLEADO_ID));-- -- TABLE: INSTRUCTOR --CREATE TABLE INSTRUCTOR(    EMPLEADO_ID           NUMBER(10, 0)    NOT NULL,    SUPLENTE              NUMBER(10, 0),    CEDULA_PROFESIONAL    NUMBER(8, 0)     NOT NULL,    EXPERIENCIA           NUMBER(3, 0)     NOT NULL,    CONSTRAINT PK5 PRIMARY KEY (EMPLEADO_ID),     CONSTRAINT RefEMPLEADO27 FOREIGN KEY (EMPLEADO_ID)    REFERENCES EMPLEADO(EMPLEADO_ID),    CONSTRAINT RefINSTRUCTOR40 FOREIGN KEY (SUPLENTE)    REFERENCES INSTRUCTOR(EMPLEADO_ID));-- -- TABLE: INSTRUCTOR_WEB --CREATE TABLE INSTRUCTOR_WEB(    INSTRUCTOR_WEB_ID    NUMBER(10, 0)     NOT NULL,    URL                  VARCHAR2(4000)    NOT NULL,    EMPLEADO_ID          NUMBER(10, 0)     NOT NULL,    CONSTRAINT PK20 PRIMARY KEY (INSTRUCTOR_WEB_ID),     CONSTRAINT RefINSTRUCTOR18 FOREIGN KEY (EMPLEADO_ID)    REFERENCES INSTRUCTOR(EMPLEADO_ID));-- -- TABLE: MULTIMEDIA --CREATE TABLE MULTIMEDIA(    MULTIMEDIA_ID      NUMBER(10, 0)    NOT NULL,    CONTENIDO          BLOB             NOT NULL,    VIGENCIA_INICIO    DATE             NOT NULL,    VIGENCIA_FIN       DATE             NOT NULL,    TIPO               VARCHAR2(6)      NOT NULL,    GIMNASIO_ID        NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK16 PRIMARY KEY (MULTIMEDIA_ID),     CONSTRAINT RefGIMNASIO14 FOREIGN KEY (GIMNASIO_ID)    REFERENCES GIMNASIO(GIMNASIO_ID));-- -- TABLE: REPORTE --CREATE TABLE REPORTE(    REPORTE_ID    NUMBER(40, 0)    NOT NULL,    PESO          NUMBER(3, 3)     NOT NULL,    IMC           NUMBER(3, 3),    ESTATURA      NUMBER(3, 3),    FECHA         DATE             NOT NULL,    CLIENTE_ID    NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK14 PRIMARY KEY (REPORTE_ID),     CONSTRAINT RefCLIENTE38 FOREIGN KEY (CLIENTE_ID)    REFERENCES CLIENTE(CLIENTE_ID));-- -- TABLE: SALA_DISCIPLINA --CREATE TABLE SALA_DISCIPLINA(    SALA_DISCIPLINA_ID    NUMBER(10, 0)    NOT NULL,    SALA_ID               NUMBER(10, 0)    NOT NULL,    DISCIPLINA_ID         NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK30 PRIMARY KEY (SALA_DISCIPLINA_ID),     CONSTRAINT RefSALA47 FOREIGN KEY (SALA_ID)    REFERENCES SALA(SALA_ID),    CONSTRAINT RefDISCIPLINA48 FOREIGN KEY (DISCIPLINA_ID)    REFERENCES DISCIPLINA(DISCIPLINA_ID));-- -- TABLE: SENSOR --CREATE TABLE SENSOR(    SENSOR_ID       NUMBER(10, 0)    NOT NULL,    NUMERO_SERIE    NUMBER(20, 0)    NOT NULL,    FECHA_COMPRA    DATE             NOT NULL,    MARCA           VARCHAR2(40)     NOT NULL,    CLIENTE_ID      NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK11 PRIMARY KEY (SENSOR_ID),     CONSTRAINT RefCLIENTE37 FOREIGN KEY (CLIENTE_ID)    REFERENCES CLIENTE(CLIENTE_ID));-- -- TABLE: SESION --CREATE TABLE SESION(    SESION_ID       NUMBER(10, 0)    NOT NULL,    NUM_SESION      NUMBER(10, 0)    NOT NULL,    FECHA_INICIO    DATE             NOT NULL,    DURACION        TIMESTAMP(6),    FECHA_FIN       DATE             NOT NULL,    TIPO            VARCHAR2(10)     NOT NULL,    EMP_INST_ID     NUMBER(10, 0)    NOT NULL,    CLIENTE_ID      NUMBER(10, 0)    NOT NULL,    SALA_ID         NUMBER(10, 0),    CONSTRAINT PK12 PRIMARY KEY (SESION_ID),     CONSTRAINT RefINSTRUCTOR34 FOREIGN KEY (EMP_INST_ID)    REFERENCES INSTRUCTOR(EMPLEADO_ID),    CONSTRAINT RefCLIENTE35 FOREIGN KEY (CLIENTE_ID)    REFERENCES CLIENTE(CLIENTE_ID),    CONSTRAINT RefSALA51 FOREIGN KEY (SALA_ID)    REFERENCES SALA(SALA_ID));-- -- TABLE: SESION_BITACORA --CREATE TABLE SESION_BITACORA(    SESION_BITACORA_ID    NUMBER(10, 0)    NOT NULL,    FECHA                 DATE             NOT NULL,    CALORIAS              NUMBER(10, 4)    NOT NULL,    SESION_ID             NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK13 PRIMARY KEY (SESION_BITACORA_ID),     CONSTRAINT RefSESION36 FOREIGN KEY (SESION_ID)    REFERENCES SESION(SESION_ID));-- -- TABLE: SESION_DISPOSITIVO --CREATE TABLE SESION_DISPOSITIVO(    SESION_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,    SESION_ID                NUMBER(10, 0)    NOT NULL,    DISPOSITIVO_ID           NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK27 PRIMARY KEY (SESION_DISPOSITIVO_ID),     CONSTRAINT RefSESION42 FOREIGN KEY (SESION_ID)    REFERENCES SESION(SESION_ID),    CONSTRAINT RefDISPOSITIVO43 FOREIGN KEY (DISPOSITIVO_ID)    REFERENCES DISPOSITIVO(DISPOSITIVO_ID));-- -- TABLE: STATUS_DISPOSITIVO --CREATE TABLE STATUS_DISPOSITIVO(    STATUS_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,    FECHA_STATUS             DATE             NOT NULL,    DISPOSITIVO_ID           NUMBER(10, 0)    NOT NULL,    STATUS_ID                NUMBER(10, 0)    NOT NULL,    CONSTRAINT PK22 PRIMARY KEY (STATUS_DISPOSITIVO_ID),     CONSTRAINT RefSTATUS30 FOREIGN KEY (STATUS_ID)    REFERENCES STATUS(STATUS_ID),    CONSTRAINT RefDISPOSITIVO31 FOREIGN KEY (DISPOSITIVO_ID)    REFERENCES DISPOSITIVO(DISPOSITIVO_ID));