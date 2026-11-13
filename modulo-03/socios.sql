-- =====================================================
-- Módulo 03 - Tabla socios (base de datos biblioteca)
-- =====================================================

-- Selecciona la base de datos biblioteca para trabajar
USE biblioteca;

-- Crea la tabla socios con sus columnas, valores por defecto y reglas
CREATE TABLE socios (
    id_socio INT UNSIGNED NOT NULL AUTO_INCREMENT,
    documento VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    celular VARCHAR(20) DEFAULT NULL,
    correo VARCHAR(100) DEFAULT NULL,
    estrato TINYINT UNSIGNED DEFAULT NULL,
    fecha_afiliacion DATE NOT NULL DEFAULT (CURDATE()),
    activo TINYINT(1) NOT NULL DEFAULT 1,
    multas_pendientes DECIMAL(8,2) NOT NULL DEFAULT 0.00,

    PRIMARY KEY (id_socio),
    CONSTRAINT uq_socios_documento UNIQUE (documento),
    CONSTRAINT uq_socios_correo UNIQUE (correo),
    CONSTRAINT chk_socios_estrato CHECK (estrato BETWEEN 1 AND 6),
    CONSTRAINT chk_socios_multas_pendientes CHECK (multas_pendientes BETWEEN 0 AND 500000)
);

-- Revisa la fecha de hoy y la fecha de afiliación guardada
SELECT CURRENT_DATE AS hoy,
       DATE_FORMAT(fecha_afiliacion, '%Y-%m-%d') AS fecha_guardada
FROM socios;

-- Muestra cómo quedó creada la tabla
SHOW CREATE TABLE socios;


-- =====================================================
-- Pruebas de reglas: cada consulta DEBE dar error
-- (ejecútalas una por una, no todo el script junto)
-- =====================================================

-- Regla que rompe: el correo debe ser único
-- Error que predigo: Error (1062): Duplicate entry correo
INSERT INTO socios (documento, nombre, celular, correo, estrato)
VALUES ('1076111333', 'Carlos Peña', '3001112234', 'carlos.pena@correo.com', 3);

-- Regla que rompe: el estrato debe ser entre 1 y 6, 7 viola esa regla
-- Error que predigo: 3819 check constraint is violated
INSERT INTO socios (documento, nombre, celular, correo, estrato)
VALUES ('1076111555', 'Carlos Peña', '3001112235', 'c.pena@correo.com', 7);

-- Regla que rompe: la multa no debe ser superior a 500.000
-- Error que predigo: Error (3819): Check constraint
UPDATE socios
SET multas_pendientes = 600000
WHERE id_socio = 2;
