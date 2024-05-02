
### SELECT ... INTO
It allows us to say where we want to get the data.

> We must declare variables, cursors and errors in this order.

### CURSOR
It is a section of memory with rows.
We use it when we need to get more than a row from a query.


```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS example6 $$
CREATE PROCEDURE example6(IN _id INT)
BEGIN
	DECLARE v_id INT;
	DECLARE v_student VARCHAR(30);

    -- DECLARE A CURSOR
    DECLARE c_students CURSOR FOR
	SELECT id, student
	FROM students
	WHERE id<=_id;

    -- OPEN CURSOR
	OPEN c_students;
	students_cursor: LOOP

        -- GET THE DATA FROM THE CURSOR
		FETCH c_students INTO v_id, v_student;
        SELECT v_id, v_student;

	END LOOP students_cursor;

    -- CLOSE CURSOR
    CLOSE c_students;
END $$
DELIMITER ;
call example6(5);
```



### HANDLER
We can declare handlers to manage errors.

```sql
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
```


```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS example8 $$
CREATE PROCEDURE example8(IN _id INT, _student VARCHAR(30))
MODIFIES SQL DATA
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062
    SELECT CONCAT('Numero de matrícula ', _id, 'ya existe') AS 'ERROR';
    DECLARE CONTINUE HANDLER FOR 1048
    SELECT 'Numero de matrícula requerido' AS 'ERROR';
    INSERT INTO students VALUES (_id, student);
END $$
DELIMITER ;
call example8(5, 'Stariluz Kozuki');
```