-- There are two ways to fill the database - manually via this file or automatically via generate_data.py

-- Players
INSERT INTO Player (nickname, login, level, experience, gold) VALUES
('NyxTheMage', 'nyx01', 21, 1400, 2500),
('TankBoi', 'tanklord', 18, 1000, 3200),
('ArrowSoul', 'archer22', 17, 1200, 5000);

-- Pets
INSERT INTO Pet (name, race, player) VALUES
('Fluff', 'dragon', 'NyxTheMage'),
('Bolt', 'wolf', 'TankBoi'),
('Whiskers', 'cat', 'ArrowSoul');

-- Ability
INSERT INTO Ability (name, ability) VALUES
('Fluff', 'strength+3'),
('Bolt', 'speed+2'),
('Whiskers', 'luck+5');

-- Inventory
INSERT INTO Inventory (nickname, number, capacity) VALUES
('NyxTheMage', 1, 10),
('TankBoi', 1, 20),
('ArrowSoul', 2, 15);

-- Items
INSERT INTO Item (item_name, type, cost, rarity, power, stamina, defense, nickname, number) VALUES
('Magic Wand', 'weapon', 1500, 'epic', 30, 10, 5, 'NyxTheMage', 1),
('Shield of Valor', 'armor', 900, 'rare', 0, 20, 25, 'TankBoi', 1),
('Healing Potion', 'potion', 100, 'common', 0, 0, 0, 'ArrowSoul', 2);

-- Transactions
INSERT INTO "Transaction" (server, time, player, item) VALUES
('EU-01', '2025-04-20 12:45:00', 'NyxTheMage', 'Magic Wand'),
('US-05', '2025-04-21 09:00:00', 'TankBoi', 'Shield of Valor');

-- Buying
INSERT INTO Buying (server, time, fee) VALUES
('EU-01', '2025-04-20 12:45:00', 150);

-- Selling
INSERT INTO Selling (server, time, merchant_cut) VALUES
('US-05', '2025-04-21 09:00:00', 100);

-- Combines_with
INSERT INTO Combines_with (base_item, component_item) VALUES
('Magic Wand', 'Healing Potion');
