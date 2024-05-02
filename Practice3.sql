-- 1
SELECT dept_no, COUNT(*) as employeesNumber FROM emple
GROUP BY dept_no;

-- 2
SELECT depart.*, COUNT(*) as employeesNumber FROM emple
JOIN depart ON emple.dept_no=depart.dept_no
GROUP BY emple.dept_no
HAVING COUNT(*) >5;

-- 3
SELECT depart.*, AVG(emple.salario) as mediaSalario FROM emple
JOIN depart ON emple.dept_no=depart.dept_no
GROUP BY emple.dept_no;

-- 4
SELECT apellido FROM emple
WHERE (SELECT dept_no FROM depart WHERE dnombre="VENTAS")=emple.dept_no
	  AND emple.oficio="VENDEDOR";
      
-- 5
SELECT COUNT(*) as vendedoresDeVentas FROM emple
WHERE (SELECT dept_no FROM depart WHERE dnombre="VENTAS")=emple.dept_no
	  AND emple.oficio="VENDEDOR";
      
-- 6
SELECT apellido, oficio FROM emple
WHERE (SELECT dept_no FROM depart WHERE dnombre="VENTAS")=emple.dept_no;

-- 7
SELECT depart.*, COUNT(*) as numeroDeEmpleados FROM emple
JOIN depart ON emple.dept_no=depart.dept_no
WHERE emple.oficio="EMPLEADO"
GROUP BY emple.dept_no;
      
-- 8
SELECT depart.*, COUNT(*) AS numeroEmpleados FROM emple
JOIN depart ON emple.dept_no=depart.dept_no
GROUP BY emple.dept_no
HAVING COUNT(*)=(
	SELECT MAX(numeroEmpleados) AS mayorNumeroDeEmpleados
	FROM (
		SELECT dept_no,COUNT(*) AS numeroEmpleados FROM emple
		GROUP BY emple.dept_no
	) AS cuentaDepartamentos
);
      
-- 9
SELECT depart.*, SUM(salario) AS sumaSalario FROM emple
JOIN depart ON emple.dept_no=depart.dept_no
GROUP BY emple.dept_no
HAVING SUM(salario)>(
	SELECT AVG(salario) AS salario FROM emple
);

-- 10
SELECT emple.oficio, SUM(salario) AS totalSalarioDelOficio FROM emple
GROUP BY emple.oficio;

-- 11
SELECT emple.oficio, SUM(salario) AS totalSalarioDelOficio FROM emple
WHERE dept_no=(
	SELECT dept_no FROM depart WHERE dnombre="VENTAS"
)
GROUP BY emple.oficio;

-- 12
CREATE VIEW empleadosOficina AS
SELECT dept_no,COUNT(*) AS numeroEmpleados FROM emple
        WHERE emple.oficio="EMPLEADO"
		GROUP BY emple.dept_no;
        
CREATE VIEW maxEmpleadosOficina AS
SELECT MAX(numeroEmpleados) AS mayorNumeroDeEmpleados
	FROM empleadosOficina;
    
SELECT dept_no, COUNT(*) AS numeroEmpleados FROM emple
WHERE emple.oficio="EMPLEADO"
GROUP BY emple.dept_no
HAVING COUNT(*)=(SELECT * FROM maxEmpleadosOficina);

-- 13
SELECT dept_no, COUNT(DISTINCT(oficio)) AS numeroOficiosDistintos FROM emple
GROUP BY emple.dept_no;

-- 14
SELECT DISTINCT(depart.dept_no), depart.* FROM emple
JOIN depart ON depart.dept_no=emple.dept_no
GROUP BY emple.oficio
HAVING COUNT(*)>=2;

-- 15
SELECT estanteria, SUM(unidades) as cantidadDeHerramientas FROM herramientas
GROUP BY estanteria;

-- 16
CREATE VIEW unidadesPorEstanteria AS
SELECT SUM(unidades) as cantidadDeHerramientas FROM herramientas
GROUP BY estanteria;

SELECT estanteria, SUM(unidades) as cantidadDeHerramientas FROM herramientas
GROUP BY estanteria
HAVING SUM(unidades)=(SELECT MAX(cantidadDeHerramientas) FROM unidadesPorEstanteria); 

-- 17
SELECT hospitales.*, COUNT(*) AS cantidadDeMedicos FROM medicos
JOIN hospitales ON hospitales.cod_hospital=medicos.cod_hospital
GROUP BY medicos.cod_hospital
ORDER BY medicos.cod_hospital DESC;

-- 18
CREATE VIEW hospitalEspecialidad AS
SELECT hospitales.*, medicos.especialidad AS especialidad FROM medicos
JOIN hospitales ON hospitales.cod_hospital=medicos.cod_hospital
GROUP BY medicos.cod_hospital, medicos.especialidad;

SELECT cod_hospital, nombre, GROUP_CONCAT(especialidad) as especialidades FROM hospitalEspecialidad
GROUP BY cod_hospital;

-- 19
SELECT hospitales.*, medicos.especialidad, COUNT(*) as numeroDeMedicos FROM medicos
JOIN hospitales ON hospitales.cod_hospital=medicos.cod_hospital
GROUP BY medicos.cod_hospital, medicos.especialidad;

-- 20
SELECT hospitales.*, COUNT(*) as cantidadDeEmpleados FROM personas
JOIN hospitales ON hospitales.cod_hospital=personas.cod_hospital
GROUP BY personas.cod_hospital;

-- 21
SELECT especialidad, COUNT(*) as numeroDeTrabajadores FROM medicos
GROUP BY especialidad;

-- 22
SELECT especialidad, COUNT(*) AS cantidadDeTrabajadores FROM medicos
GROUP BY especialidad
HAVING COUNT(*)=(
	SELECT MAX(cantidadDeTrabajadores) FROM (
		SELECT COUNT(*) as cantidadDeTrabajadores FROM medicos
		GROUP BY especialidad
	) AS cantidadDeTrabajadores
);

-- 23
SELECT * FROM hospitales
WHERE num_plazas=(
	SELECT MAX(num_plazas) FROM hospitales
);

-- 24
SELECT DISTINCT(estanteria) FROM herramientas
ORDER BY estanteria DESC;

-- 25
SELECT estanteria, SUM(unidades) as unidades FROM herramientas
GROUP BY estanteria;

-- 26
SELECT estanteria, SUM(unidades) as unidades FROM herramientas
GROUP BY estanteria
HAVING SUM(unidades)>15;

-- 27
SELECT estanteria, SUM(unidades) as unidades FROM herramientas
GROUP BY estanteria
HAVING SUM(unidades)=(
	SELECT MAX(unidades) FROM (
		SELECT estanteria, SUM(unidades) as unidades FROM herramientas
		GROUP BY estanteria
	) AS unidades
);

-- 28
DROP VIEW IF EXISTS empleadosEnDepartamento;
CREATE VIEW empleadosEnDepartamento AS
SELECT dept_no, COUNT(*) AS cantidadDeEmpleados FROM emple
GROUP BY dept_no;

SELECT * FROM depart
LEFT JOIN empleadosEnDepartamento ON depart.dept_no=empleadosEnDepartamento.dept_no
WHERE empleadosEnDepartamento.cantidadDeEmpleados IS NULL;

-- 29
DROP VIEW IF EXISTS empleadosEnDepartamento;
CREATE VIEW empleadosEnDepartamento AS
SELECT dept_no, COUNT(*) AS cantidadDeEmpleados FROM emple
GROUP BY dept_no;

SELECT depart.*, empleadosEnDepartamento.cantidadDeEmpleados FROM depart
LEFT JOIN empleadosEnDepartamento ON depart.dept_no=empleadosEnDepartamento.dept_no;

-- 30
DROP VIEW IF EXISTS sumaSalariosDepartamento;
CREATE VIEW sumaSalariosDepartamento AS
SELECT dept_no, SUM(salario) AS sumaSalarios FROM emple
GROUP BY dept_no;

SELECT depart.dept_no, depart.dnombre, sumaSalariosDepartamento.sumaSalarios FROM depart
LEFT JOIN sumaSalariosDepartamento ON depart.dept_no=sumaSalariosDepartamento.dept_no;

-- 31
DROP VIEW IF EXISTS sumaSalariosDepartamento;
CREATE VIEW sumaSalariosDepartamento AS
SELECT dept_no, SUM(salario) AS sumaSalarios FROM emple
GROUP BY dept_no;

SELECT depart.dept_no, depart.dnombre, IFNULL(sumaSalariosDepartamento.sumaSalarios,0) AS sumaSalarios FROM depart
LEFT JOIN sumaSalariosDepartamento ON depart.dept_no=sumaSalariosDepartamento.dept_no;

-- 32
DROP VIEW IF EXISTS cantidadDeMedicosEnHospital;
CREATE VIEW cantidadDeMedicosEnHospital AS
SELECT cod_hospital, COUNT(*) AS cantidadDeMedicos FROM medicos
GROUP BY cod_hospital;

SELECT hospitales.cod_hospital, hospitales.nombre, cantidadDeMedicosEnHospital.cantidadDeMedicos FROM hospitales
LEFT JOIN cantidadDeMedicosEnHospital ON hospitales.cod_hospital=cantidadDeMedicosEnHospital.cod_hospital;


