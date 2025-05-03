- 01: Players' Pets (Level 17+)
SELECT p.nickname, pet.name
FROM Player p
JOIN Pet pet ON p.nickname = pet.player
WHERE p.level >= 17;
-- Shows player name and their pet if the player's level is 17 or higher.

-- 02: Inventories with Capacity 15+
SELECT p.nickname, i.number, i.capacity
FROM Player p
JOIN Inventory i ON p.nickname = i.nickname
WHERE i.capacity > 15
ORDER BY i.capacity DESC;
-- Displays players and their inventories with capacity greater than 15.

-- 03: Rare Items and Their Owners
SELECT i.item_name, i.rarity, p.nickname
FROM Item i
JOIN Inventory inv ON i.nickname = inv.nickname
JOIN Player p ON inv.nickname = p.nickname
WHERE i.rarity = 'epic';
-- Finds items with "epic" rarity and shows their owners.

-- 04: Pets with Strength
SELECT a.name, a.ability
FROM Ability a
WHERE a.ability LIKE 'strength+%';
-- Searches for pets with strength-enhancing abilities.

-- 05: Players with Expensive Items
SELECT p.nickname, i.item_name, i.cost
FROM Player p
JOIN Inventory inv ON p.nickname = inv.nickname
JOIN Item i ON inv.nickname = i.nickname AND inv.number = i.number
WHERE i.cost > 800
ORDER BY i.cost DESC;
-- Lists players with items costing more than 800.

-- 06: Filtered Potion Transactions (04:00–05:00)
SELECT t.server, t.time, t.player, i.type, i.rarity
FROM Transaction t
JOIN Item i ON t.item = i.item_name
WHERE i.type = 'potion'
  AND i.rarity = 'common'
  AND t.time::time >= '04:00:00'
  AND t.time::time < '05:00:00'
ORDER BY t.time DESC;
-- Displays all transactions with common potions between 04:00 and 05:00.

-- 07: Top 3 Players by Experience
SELECT nickname, experience
FROM Player
ORDER BY experience DESC
LIMIT 3;
-- Lists top 3 players by experience.

-- 08: Players with Rare Items and Gold
SELECT p.nickname, SUM(p.gold) AS total_gold
FROM Player p
JOIN Item i ON p.nickname = i.nickname
WHERE i.rarity = 'rare'
GROUP BY p.nickname
HAVING SUM(p.gold) > 3000;
-- Finds players with rare items and more than 3000 gold.

-- 09: Sales and Purchases Count per Server
SELECT server, COUNT(*) AS count, 'buying' AS type
FROM Buying
GROUP BY server
UNION
SELECT server, COUNT(*) AS count, 'selling' AS type
FROM Selling
GROUP BY server;
-- Merges purchase and sales counts for each server.

-- 10: Players and Pets – Join with Sorting
SELECT p.nickname, pt.name AS pet_name
FROM Player p
JOIN Pet pt ON p.nickname = pt.player
ORDER BY p.nickname;
-- Joins players with their pets and sorts by player name.

-- 11: Players with a Dragon Pet
SELECT p.nickname
FROM Player p
JOIN Pet pt ON p.nickname = pt.player
WHERE pt.race = 'dragon';
-- Finds all players who have a pet of race "dragon".

-- 12: Last 10 Transactions
SELECT *
FROM Transaction
ORDER BY time DESC
LIMIT 10;
-- Shows the last 10 transactions by time.

-- 13: Middle-Class Players
SELECT DISTINCT p.nickname
FROM Player p
WHERE EXISTS (
  SELECT 1
  FROM Item i
  WHERE i.nickname = p.nickname AND i.cost > 900
);
-- Finds players with at least one item costing more than 900.
