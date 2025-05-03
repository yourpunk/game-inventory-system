-- Speeds up searching for players by name
CREATE INDEX idx_player_nickname ON Player(nickname);

-- Speeds up connections between Player and Pet
CREATE INDEX idx_pet_player ON Pet(player);

-- Speeds up filtering and connections by item name
CREATE INDEX idx_item_name ON Item(item_name);

-- Speeds up the search by item rarity
CREATE INDEX idx_item_rarity ON Item(rarity);

-- Speeds up connections between Item and Inventory
CREATE INDEX idx_item_nick_number ON Item(nickname, number);

-- Speeds up transaction filtering by time
CREATE INDEX idx_transaction_time ON "Transaction"(time);

-- Speeds up grouping and counting of server operations
CREATE INDEX idx_buying_server ON Buying(server);
CREATE INDEX idx_selling_server ON Selling(server);
