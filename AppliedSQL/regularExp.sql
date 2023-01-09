-- Use ordinality for lpad --
SELECT  lpad('*', CAST(ordinality AS int), '*')
FROM    generate_series(1,10) WITH ordinality;

-- Probando en series distintas --
SELECT  lpad('*', CAST(ordinality AS int), '*')
FROM    generate_series(10,2, -2) WITH ordinality;

/**
  * Usar expresiones regulares
  */

SELECT email
FROM platzi.alumnos
WHERE email ~*'[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}';

SELECT email
FROM platzi.alumnos
WHERE email ~*'[A-Z0-9._%+-]+@google[A-Z0-9.-]+\.[A-Z]{2,4}';

SELECT email
FROM platzi.alumnos
WHERE email ~*'[A-Z0-9._%±]+@google[A-Z0-9.-]+.[A-Z]{2,4}';