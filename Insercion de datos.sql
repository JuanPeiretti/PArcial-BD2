INSERT INTO participante (legajo, nombre)
VALUES
(1234,'Martin'),
(2345,'Marcelo'),
(3456,'Claudia');

SELECT * FROM participante;

INSERT INTO rol (nombre)
VALUES
('Desarrollador'),
('Tester'),
('Project Manager');

SELECT * FROM rol;

INSERT INTO proyecto (nombre)
VALUES
('Proyecto 1'),
('Proyecto 2'),
('Proyecto 3');

SELECT * FROM proyecto;

INSERT INTO asignacion (cant_hs_dia, cant_hs_semana, cant_hs_mes)
VALUES
(8,40,160),
(4,20,80),
(6,30,120);

SELECT * FROM asignacion;

INSERT INTO dia (nombre)
VALUES
('Lunes'),
('Martes'),
('Miercoles'),
('Jueves'),
('Viernes');

SELECT * FROM dia;

INSERT INTO participacion (participante_legajo, participante_nombre, proyecto_nombre, rol_nombre)
SELECT p.legajo, p.nombre, pr.nombre, r.nombre
FROM participante p, proyecto pr, rol r
WHERE p.legajo=1234 AND  pr.id=1 AND  r.id=1


INSERT INTO participacion (participante_legajo, participante_nombre, proyecto_nombre, rol_nombre)
SELECT p.legajo, p.nombre, pr.nombre, r.nombre
FROM participante p, proyecto pr, rol r
WHERE p.legajo=1234 AND  pr.id=2 AND  r.id=2

INSERT INTO participacion (participante_legajo, participante_nombre, proyecto_nombre, rol_nombre)
SELECT p.legajo, p.nombre, pr.nombre, r.nombre
FROM participante p, proyecto pr, rol r
WHERE p.legajo=1234 AND  pr.id=3 AND  r.id=3

INSERT INTO participacion (participante_legajo, participante_nombre, proyecto_nombre, rol_nombre)
SELECT p.legajo, p.nombre, pr.nombre, r.nombre
FROM participante p, proyecto pr, rol r
WHERE p.legajo=2345 AND  pr.id=2 AND  r.id=1

INSERT INTO participacion (participante_legajo, participante_nombre, proyecto_nombre, rol_nombre)
SELECT p.legajo, p.nombre, pr.nombre, r.nombre
FROM participante p, proyecto pr, rol r
WHERE p.legajo=2345 AND  pr.id=3 AND  r.id=2

INSERT INTO participacion (participante_legajo, participante_nombre, proyecto_nombre, rol_nombre)
SELECT p.legajo, p.nombre, pr.nombre, r.nombre
FROM participante p, proyecto pr, rol r
WHERE p.legajo=3456 AND  pr.id=1 AND  r.id=2




INSERT INTO asignacion (id_participacion, dias,participante_legajo)
SELECT p.id, d.nombre , p.participante_legajo
FROM participacion p, dia d
ORDER  BY p.participante_legajo, d.id 





CALL CalcularLiquidacionMensual;
CALL RendicionDeHoras;
CALL RendicionDeHorasDia;
CALL RendicionDeHorasSemana;
CALL RendicionDeHorasMes;

DROP PROCEDURE CalcularLiquidacionMensual;
DROP TABLE liquidacion;
DROP PROCEDURE RendicionDeHoras;
DROP PROCEDURE RendicionDeHorasSemana;
DROP PROCEDURE RendicionDeHorasMes;

DROP  TEMPORARY  TABLE horas_semana; 

DROP  TEMPORARY  TABLE horas_mes; 

SELECT * from hs_mes
SELECT * from hs_semana
SELECT * from horas_semana
SELECT * from participacion
SELECT * FROM liquidacion