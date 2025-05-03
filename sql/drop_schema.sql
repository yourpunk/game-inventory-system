-- Drop tables in the correct order (respecting FK constraints)
DROP TABLE IF EXISTS Combines_with;
DROP TABLE IF EXISTS Selling;
DROP TABLE IF EXISTS Buying;
DROP TABLE IF EXISTS "Transaction";
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Ability;
DROP TABLE IF EXISTS Pet;
DROP TABLE IF EXISTS Player;

-- (Optional) Recreate schema (if needed)
-- You can add your CREATE TABLE scripts here
-- For example:
CREATE TABLE Player (
    nickname VARCHAR(50) PRIMARY KEY,
    login VARCHAR(50) NOT NULL,
    level INT NOT NULL,
    experience INT NOT NULL,
    gold INT DEFAULT 0 CHECK (gold >= 0)
);

-- Add all other CREATE TABLE statements here...

-- (Optional) Populate with sample data
-- INSERT INTO Player (nickname, login, level, experience, gold) VALUES ('punkKitten', 'kitty123', 5, 250, 100);

-- Commit if you're using transactions (like in PostgreSQL)
COMMIT;

