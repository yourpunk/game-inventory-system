-- 1. View: Active Inventories
-- shows which players' inventories are actually in use (not empty)
CREATE VIEW ActiveInventories AS
SELECT p.nickname, i.number AS inventory_number, i.capacity, COUNT(it.item_name) AS item_count
FROM Player p
JOIN Inventory i ON p.nickname = i.nickname
LEFT JOIN Item it ON i.nickname = it.nickname AND i.number = it.number
GROUP BY p.nickname, i.number, i.capacity
HAVING COUNT(it.item_name) > 0;

-- 2. View: RecentTransactions
-- shows all transactions for the last week
CREATE VIEW RecentTransactions AS
SELECT t.server, t.time, t.player, i.item_name, i.type, i.rarity
FROM "Transaction" t
JOIN Item i ON t.item = i.item_name
WHERE t.time > NOW() - INTERVAL '7 days'
ORDER BY t.time DESC;

-- 3. View: CraftableItems
-- shows a list of items that can be crafted and what is needed for this
CREATE VIEW CraftableItems AS
SELECT DISTINCT c.base_item AS item_to_craft, c.component_item AS required_component
FROM Combines_with c
JOIN Item i ON c.base_item = i.item_name
ORDER BY c.base_item;
