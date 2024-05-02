DELIMITER $$
DROP PROCEDURE IF EXISTS operator1 $$
CREATE PROCEDURE operator1()
BEGIN
    DECLARE a INT DEFAULT 2;
    DECLARE b INT DEFAULT 256;
    DECLARE c FLOAT DEFAULT 440.56;

    SET c=c+b/a;
    SELECT c;
    SELECT c/2*3;
    SELECT b%a;
END $$
DELIMITER ;
call operator1();




DELIMITER $$
DROP PROCEDURE IF EXISTS example1 $$
CREATE PROCEDURE romanos1 (IN d INT)
BEGIN
DECLARE day INT;
SET day = d;
IF day = 1 THEN
    SELECT 'Sunday';
ELSEIF day = 2 THEN
    SELECT 'Monday';
ELSEIF day = 3 THEN
    SELECT 'Tuesday';
ELSEIF day = 4 THEN
    SELECT 'Wednesday';
ELSEIF day = 5 THEN
    SELECT 'Thursday';
ELSEIF day = 6 THEN
    SELECT 'Friday';
ELSEIF day = 7 THEN
    SELECT 'Saturday';
ELSE
    SELECT 'Day not exits';
END IF;
END $$
DELIMITER ;
call example1(1);




DELIMITER $$
DROP PROCEDURE IF EXISTS example2
$$
CREATE PROCEDURE example2 (IN paramNum INT)
BEGIN
DECLARE num, thousands, hundreds, tens, units INT;
DECLARE sThousands, sHundreds, sTens, sUnits TEXT;
SET num=paramNum;
SET thousands = num DIV 1000;
SET num=num % 1000;
SET hundreds = num DIV 100;
SET num=num % 100;
SET tens= num DIV 10;
SET num=num % 10;
SET units= num;

IF thousands=1 THEN
SET sThousands = 'M';
ELSEIF thousands=2 THEN
SET sThousands = 'MM';
ELSE
SET sThousands = '';
END IF;

IF hundreds=1 THEN
SET sHundreds = 'C';
ELSEIF hundreds=2 THEN
SET sHundreds = 'CC';
ELSEIF hundreds=3 THEN
SET sHundreds = 'CCC';
ELSEIF hundreds=4 THEN
SET sHundreds = 'CD';
ELSEIF hundreds=5 THEN
SET sHundreds = 'D';
ELSEIF hundreds=6 THEN
SET sHundreds = 'DC';
ELSEIF hundreds=7 THEN
SET sHundreds = 'DCC';
ELSEIF hundreds=8 THEN
SET sHundreds = 'DCCC';
ELSEIF hundreds=9 THEN
SET sHundreds = 'CM';
ELSE
SET sHundreds = '';
END IF;

IF tens=1 THEN
SET sTens = 'X';
ELSEIF tens=2 THEN
SET sTens = 'XX';
ELSEIF tens=3 THEN
SET sTens = 'XXX';
ELSEIF tens=4 THEN
SET sTens = 'XL';
ELSEIF tens=5 THEN
SET sTens = 'L';
ELSEIF tens=6 THEN
SET sTens = 'LX';
ELSEIF tens=7 THEN
SET sTens = 'LXX';
ELSEIF tens=8 THEN
SET sTens = 'LXXX';
ELSEIF tens=9 THEN
SET sTens = 'XM';
ELSE
SET sTens = '';
END IF;

IF units=1 THEN
SET sUnits = 'I';
ELSEIF units=2 THEN
SET sUnits = 'II';
ELSEIF units=3 THEN
SET sUnits = 'III';
ELSEIF units=4 THEN
SET sUnits = 'IV';
ELSEIF units=5 THEN
SET sUnits = 'V';
ELSEIF units=6 THEN
SET sUnits = 'VI';
ELSEIF units=7 THEN
SET sUnits = 'VII';
ELSEIF units=8 THEN
SET sUnits = 'VIII';
ELSEIF units=9 THEN
SET sUnits = 'IX';
ELSE
SET sUnits = '';
END IF;

SELECT thousands, hundreds, tens, units, CONCAT(sThousands, sHundreds, sTens, sUnits) as result;
END $$
DELIMITER ;



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

call example2(444);