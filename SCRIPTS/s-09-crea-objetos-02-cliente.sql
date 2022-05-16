--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       14/05/2022
--@Descripcion: Crea objetos de modulo cliente

Prompt Creando secuencias.
-- SEQUENCE: CLIENTE 
CREATE SEQUENCE CLIENTE_S
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
CACHE 20;
-- SEQUENCE: SESION 
CREATE SEQUENCE SESION_S
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
CACHE 20;
-- SEQUENCE: BITACORA 
CREATE SEQUENCE BITACORA_S
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
CACHE 20;
-- SEQUENCE: CREDENCIAL 
CREATE SEQUENCE CREDENCIAL_S
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
CACHE 20;
-- SEQUENCE: REPORTE 
CREATE SEQUENCE REPORTE_S
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
CACHE 20;
-- SEQUENCE: SENSOR 
CREATE SEQUENCE SENSOR_S
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
CACHE 20;
-- SEQUENCE: SESION_DISPOSITIVO 
CREATE SEQUENCE SESION_DISPOSITIVO_S
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
CACHE 20;

Prompt Creando tablas.
-- TABLE: CLIENTE 
CREATE TABLE CLIENTE
(
  CLIENTE_ID          NUMBER(10, 0)     NOT NULL,
  NOMBRE              VARCHAR2(40)      NOT NULL,
  AP_PAT              VARCHAR2(40)      NOT NULL,
  AP_MAT              VARCHAR2(40),
  EMAIL               VARCHAR2(40)      NOT NULL,
  USERNAME            VARCHAR2(40)      NOT NULL,
  PASSWORD            VARCHAR2(40)      NOT NULL,
  DIRECCION           VARCHAR2(4000)    NOT NULL,
  FECHA_NACIMIENTO    DATE              NOT NULL,
  CURP                VARCHAR2(18)      NOT NULL,
  FOTO                BLOB              NOT NULL,
  CONSTRAINT CLIENTE_PK PRIMARY KEY (CLIENTE_ID) USING INDEX
  (
    CREATE UNIQUE INDEX CLIENTE_PK ON CLIENTE(CLIENTE_ID)
    tablespace indices_ts
  ),
  CONSTRAINT CLIENTE_EMAIL_UK UNIQUE (EMAIL),
  CONSTRAINT CLIENTE_USERNAME_UK UNIQUE (USERNAME),
  CONSTRAINT CLIENTE_CURP_UK UNIQUE (CURP)
)
lob(FOTO) store as (tablespace blob_ts)
tablespace clientes_ts;
-- TABLE: SESION 
CREATE TABLE SESION
(
  SESION_ID       NUMBER(10, 0)    NOT NULL,
  NUM_SESION      NUMBER(10, 0)    NOT NULL,
  FECHA_INICIO    DATE             NOT NULL,
  DURACION        DATE,
  FECHA_FIN       DATE             NOT NULL,
  TIPO            VARCHAR2(10)     NOT NULL,
  EMP_INST_ID     NUMBER(10, 0)    NOT NULL,
  CLIENTE_ID      NUMBER(10, 0)    NOT NULL,
  SALA_ID         NUMBER(10, 0),
  CONSTRAINT SESION_PK PRIMARY KEY (SESION_ID) USING INDEX
  (
    CREATE UNIQUE INDEX SESION_PK ON SESION(SESION_ID)
    tablespace indices_ts
  ),
  CONSTRAINT SESION_NUM_SESION_UK UNIQUE (NUM_SESION),
  CONSTRAINT SESION_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_ID)
  REFERENCES CLIENTE(CLIENTE_ID)
)
tablespace sesiones_ts;
grant select on cliente01.SESION to gimnasio01;
-- TABLE: BITACORA 
CREATE TABLE BITACORA
(
  BITACORA_ID    NUMBER(10, 0)    NOT NULL,
  FECHA          DATE             NOT NULL,
  CALORIAS       NUMBER(10, 4)    NOT NULL,
  SESION_ID      NUMBER(10, 0)    NOT NULL,
  CONSTRAINT BITACORA_PK PRIMARY KEY (BITACORA_ID) USING INDEX
  (
    CREATE UNIQUE INDEX BITACORA_PK ON BITACORA(BITACORA_ID)
    tablespace indices_ts
  ),
  CONSTRAINT BITACORA_SESION_ID_FK FOREIGN KEY (SESION_ID)
  REFERENCES SESION(SESION_ID)
)
tablespace historial_ts;
-- TABLE: CREDENCIAL 
CREATE TABLE CREDENCIAL
(
  CLIENTE_ID    NUMBER(10, 0)    NOT NULL,
  FOLIO         VARCHAR2(8)      NOT NULL,
  VIGENCIA      DATE             NOT NULL,
  COD_BARRAS    NUMBER(13, 0)    NOT NULL,
  CONSTRAINT CREDENCIAL_PK PRIMARY KEY (CLIENTE_ID) USING INDEX
  (
    CREATE UNIQUE INDEX CREDENCIAL_PK ON CREDENCIAL(CLIENTE_ID)
    tablespace indices_ts
  ),
  CONSTRAINT CREDENCIAL_FOLIO_UK UNIQUE (FOLIO),
  CONSTRAINT CREDENCIAL_COD_BARRAS_UK UNIQUE (COD_BARRAS),
  CONSTRAINT CREDENCIAL_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_ID)
  REFERENCES CLIENTE(CLIENTE_ID)
)
tablespace clientes_ts;
-- TABLE: REPORTE 
CREATE TABLE REPORTE
(
  REPORTE_ID    NUMBER(10, 0)    NOT NULL,
  PESO          NUMBER(10, 4)    NOT NULL,
  IMC           NUMBER(10, 4),
  ESTATURA      NUMBER(10, 4),
  FECHA         DATE             NOT NULL,
  CLIENTE_ID    NUMBER(10, 0)    NOT NULL,
  CONSTRAINT REPORTE_PK PRIMARY KEY (REPORTE_ID) USING INDEX
  (
    CREATE UNIQUE INDEX REPORTE_PK ON REPORTE(REPORTE_ID)
    tablespace indices_ts
  ),
  CONSTRAINT REPORTE_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_ID)
  REFERENCES CLIENTE(CLIENTE_ID)
)
tablespace historial_ts;
-- TABLE: SENSOR 
CREATE TABLE SENSOR
(
  SENSOR_ID       NUMBER(10, 0)    NOT NULL,
  NUM_SERIE       NUMBER(20, 0)    NOT NULL,
  FECHA_COMPRA    DATE             NOT NULL,
  MARCA           VARCHAR2(40)     NOT NULL,
  CLIENTE_ID      NUMBER(10, 0)    NOT NULL,
  CONSTRAINT SENSOR_PK PRIMARY KEY (SENSOR_ID) USING INDEX
  (
    CREATE UNIQUE INDEX SENSOR_PK ON SENSOR(SENSOR_ID)
    tablespace indices_ts
  ),
  CONSTRAINT SENSOR_NUM_SERIE_UK UNIQUE (NUM_SERIE),
  CONSTRAINT SENSOR_CLIENTE_ID_FK FOREIGN KEY (CLIENTE_ID)
  REFERENCES CLIENTE(CLIENTE_ID)
)
tablespace clientes_ts;
-- TABLE: SESION_DISPOSITIVO 
CREATE TABLE SESION_DISPOSITIVO
(
  SESION_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
  SESION_ID                NUMBER(10, 0)    NOT NULL,
  DISPOSITIVO_ID           NUMBER(10, 0)    NOT NULL,
  CONSTRAINT SESION_DISPOSITIVO_PK PRIMARY KEY (SESION_DISPOSITIVO_ID)
  USING INDEX
  (
    CREATE UNIQUE INDEX SESION_DISPOSITIVO_PK
    ON SESION_DISPOSITIVO(SESION_DISPOSITIVO_ID)
    tablespace indices_ts
  ),
  CONSTRAINT SESION_DISPOSITIVO_SESON_ID_FK FOREIGN KEY (SESION_ID)
  REFERENCES SESION(SESION_ID)
)
tablespace sesiones_ts;
grant select on cliente01.SESION_DISPOSITIVO to gimnasio01;

Prompt Creando indices
-- INDEX: SESION
CREATE INDEX SESION_EMP_INST_ID_IX ON SESION(EMP_INST_ID)
tablespace indices_ts;
CREATE INDEX SESION_CLIENTE_ID_IX ON SESION(CLIENTE_ID)
tablespace indices_ts;
CREATE INDEX SESION_SALA_ID_IX ON SESION(SALA_ID)
tablespace indices_ts;
-- INDEX: BITACORA
CREATE INDEX BITACORA_SESION_ID_IX ON BITACORA(SESION_ID)
tablespace indices_ts;
-- INDEX: REPORTE
CREATE INDEX REPORTE_CLIENTE_ID_IX ON REPORTE(CLIENTE_ID)
tablespace indices_ts;
-- INDEX: SENSOR
CREATE INDEX SENSOR_CLIENTE_ID_IX ON SENSOR(CLIENTE_ID)
tablespace indices_ts;
-- INDEX: SESION_DISPOSITIVO
CREATE INDEX SESION_DISPOSITIVO_SESON_ID_IX ON SESION_DISPOSITIVO(SESION_ID)
tablespace indices_ts;
CREATE INDEX SESION_DISPOSITIVO_ID_IX ON SESION_DISPOSITIVO(DISPOSITIVO_ID)
tablespace indices_ts;