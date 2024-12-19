```sql
create table Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VAR_CHAR(45),
    address VAR_CHAR(100)
);
create table Accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    balance DECIMAL(15, 2),
    target_account_id INT,
    name VAR_CHAR(100)
    FOREIGN KEY (target_account_id) REFERENCES Accounts(id),
);

create table Transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_account_id INT,
    target_account_id INT,
    mount DECIMAL(15, 2),
    date TIMESTAMP,
    FOREIGN KEY (source_account_id) REFERENCES Accounts(id),
    FOREIGN KEY (target_account_id) REFERENCES Accounts(id)
)

```
```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS registerUser $$
CREATE PROCEDURE registerUser(
    IN p_name VARCHAR(100),
    IN p_address VARCHAR(255)
);
BEGIN
    START TRANSACTION;

    INSERT INTO Users (name, address) VALUES (p_name, p_address);
    SET @last_user_id = LAST_INSERT_ID();

    INSERT INTO Accounts (balance, user_id) VALUES (0, last_user_id);

    COMMIT;
END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS performTransfer $$
CREATE PROCEDURE performTransfer(
    IN p_account_origin_id INT,
    IN p_account_destination_id INT,
    IN p_amount DECIMAL(15, 2)
);
BEGIN
    START TRANSACTION;

    SELECT balance INTO @balance_origin FROM Accounts WHERE ID = p_account_origin_id;
    IF @balance_origin >= p_amount THEN
        UPDATE Accounts SET balance = balance - p_amount WHERE ID = p_account_origin_id;
        UPDATE Accounts SET balance = balance + p_amount WHERE ID = p_account_destination_id;
        INSERT INTO Transactions (account_origin, account_destination, amount, date) VALUES (p_account_origin_id, p_account_destination_id, p_amount, NOW());
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS checkBalance $$
CREATE PROCEDURE checkBalance(
    IN p_account_id INT
);
BEGIN
    START TRANSACTION;

    SELECT balance FROM Accounts WHERE ID = p_account_id;

    COMMIT;
END $$

DELIMITER ;


```
