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
    UNTIL i=4
    END REPEAT repeat1;
END
$$
DELIMITER ;
call repeatExample1();