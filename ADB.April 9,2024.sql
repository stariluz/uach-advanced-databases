DELIMITER $$
DROP PROCEDURE IF EXISTS insertPokemon $$
CREATE PROCEDURE insertPokemon(IN _id INT, pokemonName VARCHAR(30), pokemonType VARCHAR(30))
MODIFIES SQL DATA
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062
        SELECT CONCAT('Pokemon ', _id, 'already exists') AS 'ERROR';
    DECLARE CONTINUE HANDLER FOR 1048
        SELECT 'Pokemon number is required' AS 'ERROR';
    INSERT INTO pokemons VALUES (_id, pokemonName, pokemonType);
    SELECT 'Pokemon inserted';
END $$
DELIMITER ;
call insertPokemon(1, 'Bulbasaur', 'Plant/Poison');






DELIMITER $$
DROP PROCEDURE IF EXISTS updatePokemon $$
CREATE PROCEDURE updatePokemon(IN _id INT, _pokemonName VARCHAR(30), _pokemonType VARCHAR(30))
MODIFIES SQL DATA
BEGIN
    DECLARE row_count INT;
    
    DECLARE CONTINUE HANDLER FOR 1048
        SELECT 'Pokemon number is required' AS 'ERROR';
    
    UPDATE pokemons SET pokemonName = _pokemonName, pokemonType = _pokemonType WHERE id = _id;
END $$
DELIMITER ;

call updatePokemon(2, 'Squi', 'Water');



DELIMITER $$
DROP PROCEDURE IF EXISTS deletePokemon $$
CREATE PROCEDURE deletePokemon(IN _id INT)
MODIFIES SQL DATA
BEGIN
    DECLARE row_count INT;
    
    DECLARE CONTINUE HANDLER FOR 1048
        SELECT 'Pokemon number is required' AS 'ERROR';
    
    SELECT COUNT(*) INTO row_count FROM pokemons WHERE id = _id;
    
    IF row_count > 0 THEN
        DELETE FROM pokemons WHERE id = _id;
        SELECT CONCAT('Pokemon ', _id, ' deleted successfully') AS 'SUCCESS';
    ELSE
        SELECT CONCAT('Pokemon ', _id, ' not found to delete') AS 'ERROR';
    END IF;
END $$
DELIMITER ;

CALL deletePokemon(2);



DELIMITER $$
DROP PROCEDURE IF EXISTS getPokemonInfo $$
CREATE PROCEDURE getPokemonInfo(IN _id INT)
BEGIN
    DECLARE row_count INT;
    
    DECLARE CONTINUE HANDLER FOR 1048
        SELECT 'Pokemon number is required' AS 'ERROR';
    
    SELECT COUNT(*) INTO row_count FROM pokemons WHERE id = _id;
    
    IF row_count > 0 THEN
        SELECT * FROM pokemons WHERE id = _id;
    ELSE
        SELECT CONCAT('Pokemon ', _id, ' not found') AS 'ERROR';
    END IF;
END $$
DELIMITER ;
CALL getPokemonInfo(1);

