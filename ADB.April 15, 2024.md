# Triggers (desencadenadores o disparadores)
Se ejecutan solamente cuando se lleva a cabo una operación *Update*, *Insert* o *Delete*.

### Sintaxis
```sql
-- Create
CREATE TRIGGER tigger_name 
{BEFORE | AFTER}
{UPDATE | INSERT | DELETE}
ON table_name
FOR EACH ROW
trigger_body;

-- Drop
DROP TRIGGER tigger_name;
```

### Create
```sql
CREATE TABLE students_copy (
    id INT PRIMARY KEY,
    student VARCHAR(30)
);

DELIMITER $$
CREATE TRIGGER T1
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    INSERT INTO students_copy
    VALUES (NEW.id, NEW.student);
END $$

INSERT INTO studentsVALUES(20, 'Johana Rivera');

SELECT * FROM students;
SELECT * FROM students_copy;
```

### Update
```sql
CREATE TABLE audit(message VARCHAR(200));

DELIMITER $$
CREATE TRIGGER T2
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
    INSERT INTO audit
    VALUES (
        CONCAT(
            'Modified by ', USER(),
            ' at ', NOW(),
            '. Previous values: ', OLD.id, ', ', OLD.student,
            '. New values: ', NEW.id, ', ', NEW.student,
            '.'
        )
    );
END $$


UPDATE students
SET student = ' MARCOS DELVAL'
WHERE id=1;

SELECT * FROM audit;
```

### Delete
```sql
DELIMITER $$
CREATE TRIGGER T3
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
    INSERT INTO audit
    VALUES (
        CONCAT(
            'Deleted by ', USER(),
            ' at ', NOW(),
            '. Previous values: ', OLD.id, ', ', OLD.student,
            '.'
        )
    );
END $$

DELETE FROM students WHERE id=4;

SELECT * FROM audit;
```