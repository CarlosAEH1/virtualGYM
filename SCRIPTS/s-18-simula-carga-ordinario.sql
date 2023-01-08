--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       05/06/2022
--@Descripcion: Simula carga diaria por modulo.

Prompt Conectando como usuario gimnasio01
connect gimnasio01/gimnasio

Prompt Cargando datos en módulo gimnasio.
@s-18-dml-status-dispositivo/s-dml-11.sql
commit;

Prompt Conectando como usuario cliente01
connect cliente01/cliente

Prompt Cargando datos en módulo cliente.
@s-18-dml-cliente/s-dml-11.sql
@s-18-dml-sesion/s-dml-11.sql
@s-18-dml-bitacora/s-dml-11.sql
@s-18-dml-credencial/s-dml-11.sql
@s-18-dml-reporte/s-dml-11.sql
@s-18-dml-sensor/s-dml-11.sql
@s-18-dml-sesion-dispositivo/s-dml-11.sql
commit;

Prompt Listo
exit