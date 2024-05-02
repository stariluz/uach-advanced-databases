-- 1
SELECT * FROM personas;

-- 2
SELECT dni, apellidos, salario FROM personas;

-- 3
SELECT * FROM personas
WHERE localidad='LORCA';

-- 4
SELECT * FROM personas
WHERE localidad IN ('MURCIA','LORCA');

-- 5
SELECT * FROM personas
WHERE localidad='MURCIA' AND salario>1500;

-- 6
SELECT * FROM personas
WHERE localidad='MURCIA' AND salario>1500 AND funcion='DIRECTOR';

-- 7
SELECT * FROM personas
WHERE funcion='MEDICO'
ORDER BY apellidos DESC;

-- 8
SELECT DISTINCT localidad FROM personas;

-- 9
SELECT * FROM personas
WHERE localidad='MURCIA' AND salario>1500 AND funcion='MEDICO'
ORDER BY salario DESC;

-- 10
SELECT * FROM personas
WHERE apellidos LIKE "M%";

-- 11
SELECT * FROM personas
WHERE apellidos LIKE "%M%" AND funcion='CONSERJE';

-- 12
SELECT * FROM personas
WHERE salario BETWEEN 200 AND 1500;

-- 13
SELECT * FROM personas
WHERE funcion IN ('MEDICO','DIRECTOR');

-- 14
SELECT * FROM personas
WHERE funcion NOT IN ('CONSERJE') AND salario>1500
ORDER BY apellidos DESC;

-- 15
SELECT * FROM personas
WHERE localidad IN ('MURCIA','CARTAGENA') AND cod_hospital=1;

-- 16
SELECT UPPER(apellidos) FROM personas
WHERE cod_hospital=1;

-- 17
SELECT apellidos, LENGTH(apellidos) as longitud_apellidos FROM personas;

-- 18
SELECT LOWER(apellidos), LOWER(localidad) FROM personas
WHERE cod_hospital!=1;

-- 19
SELECT * FROM personas
WHERE cod_hospital IN (1, 2) AND salario>1500;

-- 20
SELECT * FROM personas
WHERE cod_hospital!=2 AND localidad='MURCIA';