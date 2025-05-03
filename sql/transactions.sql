-- 1. ROLLBACK on error - if the player does not have enough gold:
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Check balance
DO $$
BEGIN
    IF (SELECT gold FROM Player WHERE nickname = 'Player_1') < 500 THEN
        RAISE EXCEPTION 'Not enough gold for transfer';
    END IF;
END;
$$;
UPDATE Player SET gold = gold - 500 WHERE nickname = 'Player_1';
UPDATE Player SET gold = gold + 500 WHERE nickname = 'Player_2';
COMMIT;
-- If there is not enough gold, ROLLBACK will occur automatically due to exception.

-- 2. SERIALIZABLE + SELECT FOR UPDATE — when you need to “block” a player:
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Lock the player's line for the duration of the transaction
SELECT * FROM Player WHERE nickname = 'Player_3' FOR UPDATE;
UPDATE Player SET gold = gold + 1000 WHERE nickname = 'Player_3';
COMMIT;
-- This will protect against other parallel changes - good if you're simulating a quest bonus or reward.

-- 3. Purchase of an item with creation of a record in the transaction and in the Buying table:
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- We check if there is enough money.DO $$
BEGIN
    IF (SELECT gold FROM Player WHERE nickname = 'Player_4') < 300 THEN
        RAISE EXCEPTION 'Not enough gold to buy item';
    END IF;
END;
$$;
-- Subtract gold
UPDATE Player SET gold = gold - 300 WHERE nickname = 'Player_4';
-- Adding an item
INSERT INTO Item (item_name, type, cost, rarity, power, stamina, defense, nickname, number)
VALUES ('Sword of Fire', 'weapon', 300, 'rare', 50, 0, 10, 'Player_4', 1);
-- Registering the transaction
INSERT INTO "Transaction" (server, time, player, item)
VALUES ('EU-1', NOW(), 'Player_4', 'Sword of Fire');
-- Register the purchase
INSERT INTO Buying (server, time, fee)
VALUES ('EU-1', NOW(), 5);
COMMIT;
