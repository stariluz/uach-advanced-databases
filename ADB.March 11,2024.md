```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS romanos2
$$
CREATE PROCEDURE romanos2 (IN paramNum INT)
BEGIN
DECLARE num, thousands, hundreds, tens, units INT;
DECLARE sThousands, sHundreds, sTens, sUnits TEXT;
SET num = paramNum;
SET thousands = num DIV 1000;
SET num = num % 1000;
SET hundreds = num DIV 100;
SET num = num % 100;
SET tens = num DIV 10;
SET num = num % 10;
SET units = num;

CASE thousands
WHEN 1 THEN
    SET sThousands = 'M';
WHEN 2 THEN
    SET sThousands = 'MM';
ELSE
    SET sThousands = '';
END CASE;

CASE hundreds
WHEN 1 THEN
    SET sHundreds = 'C';
WHEN 2 THEN
    SET sHundreds = 'CC';
WHEN 3 THEN
    SET sHundreds = 'CCC';
WHEN 4 THEN
    SET sHundreds = 'CD';
WHEN 5 THEN
    SET sHundreds = 'D';
WHEN 6 THEN
    SET sHundreds = 'DC';
WHEN 7 THEN
    SET sHundreds = 'DCC';
WHEN 8 THEN
    SET sHundreds = 'DCCC';
WHEN 9 THEN
    SET sHundreds = 'CM';
ELSE
    SET sHundreds = '';
END CASE;

CASE tens
WHEN 1 THEN
    SET sTens = 'X';
WHEN 2 THEN
    SET sTens = 'XX';
WHEN 3 THEN
    SET sTens = 'XXX';
WHEN 4 THEN
    SET sTens = 'XL';
WHEN 5 THEN
    SET sTens = 'L';
WHEN 6 THEN
    SET sTens = 'LX';
WHEN 7 THEN
    SET sTens = 'LXX';
WHEN 8 THEN
    SET sTens = 'LXXX';
WHEN 9 THEN
    SET sTens = 'XM';
ELSE
    SET sTens = '';
END CASE;

CASE units
WHEN 1 THEN
    SET sUnits = 'I';
WHEN 2 THEN
    SET sUnits = 'II';
WHEN 3 THEN
    SET sUnits = 'III';
WHEN 4 THEN
    SET sUnits = 'IV';
WHEN 5 THEN
    SET sUnits = 'V';
WHEN 6 THEN
    SET sUnits = 'VI';
WHEN 7 THEN
    SET sUnits = 'VII';
WHEN 8 THEN
    SET sUnits = 'VIII';
WHEN 9 THEN
    SET sUnits = 'IX';
ELSE
    SET sUnits = '';
END CASE;

-- SELECT thousands, hundreds, tens, units;
SELECT thousands, hundreds, tens, units, CONCAT(sThousands, sHundreds, sTens, sUnits) as result;
END $$
DELIMITER ;

call romanos2(444);
```

# LOOP
```sql
-- Sintaxis:
[tag]:LOOP
    -- instructions
END LOOP [tag];
```
> We use `LEAVE [tag]` to leave an loop 

> We use `ITERATE [tag]` to jump to the next iteration

Example:
```
DELIMITER $$
DROP PROCEDURE IF EXISTS loopExample1
$$
CREATE PROCEDURE loopExample1()
BEGIN
    DECLARE i TINYINT UNSIGNED;
    SET i=0;
    loop1:LOOP
        set i=i+1;

        IF i=3 THEN
            ITERATE loop1;
        END IF;

        select 'Valor de i='+i as I;

        IF i=4 THEN
            LEAVE loop1;
        END IF;
    END LOOP loop1;
END
$$
DELIMITER ;
call loopExample1();
```

# REPEAT
```sql
-- Sintaxis:
[tag]:REPEAT
    -- instructions
    UNTIL [counter]=[limit]
END REPEAT [tag];
```
> We use `UNTIL [counter]=[limit]` to end the iteration when the variable in the place of counter, reach the limit given

Example:
```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS repeatExample1
$$
CREATE PROCEDURE repeatExample1()
BEGIN
    DECLARE i TINYINT UNSIGNED;
    SET i=0;
    repeat1:REPEAT
        set i=i+1;

        IF i=3 THEN
            ITERATE repeat1;
        END IF;

        select 'Valor de i='+i as I;


        -- # We can use LEAVE but, it will do the same than UNTIL do
        -- IF i=4 THEN
        --     LEAVE loop1;
        -- END IF;
        
    UNTIL i=4
    END REPEAT repeat1;
END
$$
DELIMITER ;
call repeatExample1();
```

# WHILE
```sql
-- Sintaxis:
[tag]:WHILE [expresion] DO
    -- instructions
END WHILE [tag];
```
Example:
```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS whileExample1
$$
CREATE PROCEDURE whileExample1()
BEGIN
    DECLARE i TINYINT UNSIGNED;
    SET i=0;
    while1:WHILE
        set i=i+1;

        IF i=3 THEN
            ITERATE while1;
        END IF;

        select 'Valor de i='+i as I;


        -- # We can use LEAVE but, it will do the same than UNTIL do
        -- IF i=4 THEN
        --     LEAVE loop1;
        -- END IF;
        
    UNTIL i=4
    END WHILE while1;
END
$$
DELIMITER ;
call whileExample1();
```