-- =====================================================
-- Módulo 02 - Tabla libros (base de datos biblioteca)
-- =====================================================

-- Crea la base de datos biblioteca
CREATE DATABASE IF NOT EXISTS biblioteca;

-- Selecciona la base de datos biblioteca para trabajar
USE biblioteca;

-- Crea la tabla libros con sus columnas y tipos
CREATE TABLE libros (
    id_libro INT UNSIGNED,
    titulo VARCHAR(250),
    autor VARCHAR(50),
    isbn CHAR(13),
    anio_publicacion SMALLINT UNSIGNED,
    numero_paginas SMALLINT UNSIGNED,
    precio_reposicion DECIMAL(9,2),
    disponible BOOLEAN,
    fecha_ingreso DATE,
    resumen TEXT
);


-- =====================================================
-- Cambios a la estructura con ALTER TABLE
-- =====================================================

-- Agrega la columna editorial justo después de autor
ALTER TABLE libros ADD editorial VARCHAR(50) AFTER autor;

-- Renombra numero_paginas a paginas
ALTER TABLE libros RENAME COLUMN numero_paginas TO paginas;

-- Elimina la columna resumen
ALTER TABLE libros DROP COLUMN resumen;


-- =====================================================
-- Restricciones
-- =====================================================

-- Convierte id_libro en la llave primaria
ALTER TABLE libros ADD PRIMARY KEY (id_libro);

-- Hace que id_libro sea obligatorio y se numere solo
ALTER TABLE libros MODIFY id_libro INT UNSIGNED NOT NULL AUTO_INCREMENT;

-- El título es obligatorio
ALTER TABLE libros MODIFY titulo VARCHAR(250) NOT NULL;

-- No puede haber dos libros con el mismo ISBN
ALTER TABLE libros ADD CONSTRAINT uq_libros_isbn UNIQUE (isbn);

-- El número de páginas debe ser mayor que 0
ALTER TABLE libros ADD CONSTRAINT chk_libros_paginas CHECK (paginas > 0);

-- Si no se indica, el libro queda disponible
ALTER TABLE libros ALTER disponible SET DEFAULT TRUE;


-- =====================================================
-- Consulta
-- =====================================================

-- Muestra todos los libros
SELECT * FROM libros;
