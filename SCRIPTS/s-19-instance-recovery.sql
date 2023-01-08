--@Integrantes:
--              -Elizarraras Herrera Carlos Amador
--              -Rocha García Erick Hazel
--@Fecha:       14/05/2022
--@Descripcion: Ejecuta instance recovery.

Prompt Conectando como usuario SYS
connect sys/system as sysdba

Prompt Ejecutando instance recovery.
shutdown abort;
startup open;