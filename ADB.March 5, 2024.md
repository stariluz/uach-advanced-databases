```sql
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
```
### (NO ALCANCE A ANOTAR EL TITULO DE LA TABLA)
| Name | Description |
| - | - |
| ABS |        Absolute value |
| SIGN |       Get the sign of a value, it is (1, -1 or 0) |
| MOD |        Get the mod of a value |
| FLOOR |      Round decimals to bottom |
| CEILING |    Round decimals to top |
| ROUND |      Round to the closest value |
| ROUND |      Round to the closest value with the determined terminal |
| TRUNCATE |         |
| POW |      |
| SQRT |         |

### String functions
| Name | Description |
| - | - |
| LIKE | |
| NOT | | LIKE
| BINARY | |
| STRCMP | |
| UPPER | |
| LOWER | |

### Date functions
| Name | Description |
| - | - |
| NOW | |
| DAYOFWEEK | |
| WEEKDAY | |
| DAYOFMOTH | |
| DAYOFYEAR | |
| MONTH | |
| DAYNAME | |
| MONTHNAME | |
| QUARTER | |
| WEEK | |
| YEAR | |
| HOUR | |
| MINUTE | |
| SECOND | |
| TO_DAYS | |
| DATE_ADD | |
| DATE_DIFF | |
| CURDATE | |
| CURRENT_DATE | |
| CURTTIME | |
| CURTTENT_TIME | |
| DATE_FORMAT | |

### Other functions
| Name | Description |
| - | - |
| CAST | |
| CONVERT | |
| LAST_INSERT_ID | |
| VERSION | |
| CONECTION_ID | |
| DATABASE | |
| USER | |

---
The order of declaration are:
1. Variables
2. Coursors
3. Error managers


# Excercises

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS example1 $$
CREATE PROCEDURE example1 (IN d INT)
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
```

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS romanos1 $$
CREATE PROCEDURE romanos1 (IN paramNum INT)
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

-- SELECT thousands, hundreds, tens, units;
SELECT thousands, hundreds, tens, units, CONCAT(sThousands, sHundreds, sTens, sUnits) as result;
END $$
DELIMITER ;
call example2(444);
```