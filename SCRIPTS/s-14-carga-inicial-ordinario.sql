--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       14/05/2022
--@Descripcion: Carga inicial por modulo.

Prompt Conectando como usuario gimnasio01
connect gimnasio01/gimnasio

Prompt Cargando datos en módulo gimnasio.
@s-14-dml-puesto.sql
@s-14-dml-empleado.sql
@s-14-dml-administrador.sql
@s-14-dml-instructor.sql
@s-14-dml-gimnasio.sql
@s-14-dml-sala.sql
@s-14-dml-disciplina.sql
@s-14-dml-status.sql
@s-14-dml-tipo-dispositivo.sql
@s-14-dml-dispositivo.sql
@s-14-dml-huella.sql
@s-14-dml-instructor-web.sql
@s-14-dml-multimedia.sql
@s-14-dml-sala-disciplina.sql
@s-14-dml-status-dispositivo.sql
commit;

Prompt Conectando como usuario cliente01
connect cliente01/cliente

Prompt Cargando datos en módulo cliente.
@s-14-dml-cliente.sql
@s-14-dml-sesion.sql
@s-14-dml-bitacora.sql
@s-14-dml-credencial.sql
@s-14-dml-reporte.sql
@s-14-dml-sensor.sql
@s-14-dml-sesion-dispositivo.sql
commit;

Prompt Listo
exit