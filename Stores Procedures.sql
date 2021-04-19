delimiter $$
CREATE PROCEDURE RendicionDeHorasDia ()

BEGIN
    UPDATE asignacion SET cantidad_horas_dia=FLOOR(RAND()*(9));
END;
$$


delimiter $$
CREATE PROCEDURE RendicionDeHorasSemana ()

BEGIN
    CREATE TEMPORARY TABLE hs_semana(
        legajo INT,
        cant_hs_semana INT
    );
    INSERT INTO hs_semana (legajo, cant_hs_semana)
    SELECT a.participante_legajo, SUM(a.cantidad_horas_dia)
    FROM asignacion a
    GROUP BY a.participante_legajo;
END;
$$



delimiter $$
CREATE PROCEDURE RendicionDeHorasMes ()

BEGIN
    CREATE TEMPORARY TABLE hs_mes(
        legajo INT,
        cant_hs_mes INT
    );
    INSERT INTO hs_mes (legajo, cant_hs_mes)
    SELECT a.participante_legajo, SUM(a.cantidad_horas_dia)*4
    FROM asignacion a
    GROUP BY a.participante_legajo;
END;
$$


delimiter $$
CREATE PROCEDURE RendicionDeHoras ()

BEGIN
    UPDATE asignacion SET cantidad_horas_dia=FLOOR(RAND()*(9));
    
    CREATE TEMPORARY TABLE horas_mes(
        legajo INT,
        cant_hs_mes INT
    );
    
     CREATE TEMPORARY TABLE horas_semana(
        legajo INT,
        cant_hs_semana INT
    );
    
    
	 INSERT INTO horas_mes (legajo, cant_hs_mes)
    SELECT a.participante_legajo, SUM(a.cantidad_horas_dia)*4
    FROM asignacion a
    GROUP BY a.participante_legajo;
    
    INSERT INTO horas_semana (legajo, cant_hs_semana)
    SELECT a.participante_legajo, SUM(a.cantidad_horas_dia)
    FROM asignacion a
    GROUP BY a.participante_legajo;
END;
$$


delimiter $$
CREATE PROCEDURE CalcularLiquidacionMensual ()

BEGIN
    CREATE TABLE liquidacion(
         nombre_rol VARCHAR(30),
         nombre_proyecto VARCHAR(30),
         cantDeHoras INT,
         fecha_liquidacion DATETIME,
         usuario_liquidacion INT
    );
    INSERT INTO liquidacion (nombre_rol, nombre_proyecto, cantDeHoras,fecha_liquidacion, usuario_liquidacion)
    SELECT  p.rol_nombre, p.proyecto_nombre, SUM(a.cantidad_horas_dia)*4, NOW(), a.participante_legajo 
    FROM asignacion a
    INNER JOIN participacion p ON p.id = a.id_participacion
    GROUP BY a.id_participacion;
END;
$$


