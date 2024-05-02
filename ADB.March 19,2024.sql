DELIMITER $$
DROP PROCEDURE IF EXISTS example4 $$
CREATE PROCEDURE example4()
BEGIN
	DECLARE i TINYINT UNSIGNED DEFAULT 1;
    
    -- DLL
	DROP TABLE IF EXISTS students;
    CREATE TABLE students (id INT PRIMARY KEY, student VARCHAR(30))
    ENGINE = INNODB; -- By default it will always be INNODB

	WHILE (i<=5) DO
		-- DML
		INSERT INTO students
        VALUES(i, CONCAT('Student ',i));
        SET i=i+1;
	END WHILE;
END $$
DELIMITER ;
call example4();

DELIMITER $$
DROP PROCEDURE IF EXISTS example5 $$
CREATE PROCEDURE example5(IN _id INT)
BEGIN
	DECLARE v_id INT;
	DECLARE v_student VARCHAR(30);
    SELECT id, student
    INTO v_id, v_student
    FROM students
    WHERE id=_id;
    
    SELECT v_id  'Matricula', v_student  'Nombre';
END $$
DELIMITER ;
call example5(100);


DELIMITER $$
DROP PROCEDURE IF EXISTS example6 $$
CREATE PROCEDURE example6(IN _id INT)
BEGIN
	DECLARE v_id INT;
	DECLARE v_student VARCHAR(30);
    DECLARE c_students CURSOR FOR
	SELECT id, student
	FROM students
	WHERE id<=_id;
	OPEN c_students;
	students_cursor: LOOP
		FETCH c_students INTO v_id, v_student;
        SELECT v_id, v_student;
	END LOOP students_cursor;
    CLOSE c_students;
END $$
DELIMITER ;
call example6(5);


DELIMITER $$
DROP PROCEDURE IF EXISTS example7 $$
CREATE PROCEDURE example7(IN _id INT)
BEGIN
	DECLARE v_id INT;
	DECLARE v_student VARCHAR(30);
    DECLARE v_lastrow INT DEFAULT 0;
    
    -- DECLARE A CURSOR
    DECLARE c_students CURSOR FOR
	SELECT id, student
	FROM students
	WHERE id<=_id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_lastrow = 1;
    
    -- OPEN CURSOR
	OPEN c_students;
	students_cursor: LOOP

        -- GET THE DATA FROM THE CURSOR
		FETCH c_students INTO v_id, v_student;
        IF v_lastrow = 1 THEN
            LEAVE students_cursor;
        END IF;
        SELECT v_id, v_student;

	END LOOP students_cursor;

    -- CLOSE CURSOR
    CLOSE c_students;
END $$
DELIMITER ;
call example7(4);


DELIMITER $$
DROP PROCEDURE IF EXISTS example8 $$
CREATE PROCEDURE example8(IN _id INT, _student VARCHAR(30))
MODIFIES SQL DATA
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062
    SELECT CONCAT('Numero de matrícula ', _id, ' ya existe') AS 'ERROR';
    DECLARE CONTINUE HANDLER FOR 1048
    SELECT 'Numero de matrícula requerido' AS 'ERROR';
    INSERT INTO students VALUES (_id, student);
END $$
DELIMITER ;
call example8(5, 'Stariluz Kozuki');
call example8(NULL, 'Stariluz Kozuki');
