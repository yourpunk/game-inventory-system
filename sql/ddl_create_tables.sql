- Player table: stores players and their wealth
CREATE TABLE Player (
  nickname VARCHAR(50) PRIMARY KEY,
  login VARCHAR(50) UNIQUE NOT NULL,
  level INT NOT NULL CHECK (level >= 0),
  experience INT NOT NULL CHECK (experience >= 0),
  gold INT NOT NULL CHECK (gold >= 0)
);

-- Pet table: your loyal sidekick (bound to a player)
CREATE TABLE Pet (
  name VARCHAR(50) PRIMARY KEY,
  race VARCHAR(50) NOT NULL,
  player VARCHAR(50) NOT NULL,
  FOREIGN KEY (player) REFERENCES Player(nickname)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Ability: because pets have tricks
CREATE TABLE Ability (
  name VARCHAR(50),
  ability VARCHAR(50),
  PRIMARY KEY (name, ability),
  FOREIGN KEY (name) REFERENCES Pet(name)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Inventory: every adventurer needs one
CREATE TABLE Inventory (
  nickname VARCHAR(50),
  number INT,
  login VARCHAR(50),
  capacity INT,
  PRIMARY KEY (nickname, number),
  FOREIGN KEY (nickname) REFERENCES Player(nickname),
  FOREIGN KEY (login) REFERENCES Player(login)
);

-- Item: the cool stuff
CREATE TABLE Item (
  item_name VARCHAR(100) PRIMARY KEY,
  type VARCHAR(50),
  cost INT CHECK (cost >= 0),
  rarity VARCHAR(30),
  power INT, stamina INT, defense INT,
  nickname VARCHAR(50) NOT NULL,
  number INT NOT NULL,
  FOREIGN KEY (nickname, number) REFERENCES Inventory(nickname, number)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Transaction: all your buying/selling drama
CREATE TABLE Transaction (
  server VARCHAR(50),
  time TIMESTAMP,
  player VARCHAR(50) NOT NULL,
  item VARCHAR(100) NOT NULL,
  PRIMARY KEY (server, time),
  FOREIGN KEY (player) REFERENCES Player(nickname)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (item) REFERENCES Item(item_name)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Buying: spending that gold
CREATE TABLE Buying (
  server VARCHAR(50),
  time TIMESTAMP,
  fee INT CHECK (fee >= 0),
  PRIMARY KEY (server, time),
  FOREIGN KEY (server, time) REFERENCES Transaction(server, time)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Selling: get rich (kinda)
CREATE TABLE Selling (
  server VARCHAR(50),
  time TIMESTAMP,
  merchant_cut INT CHECK (merchant_cut >= 0),
  PRIMARY KEY (server, time),
  FOREIGN KEY (server, time) REFERENCES Transaction(server, time)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Combines_with: potion-brewing meets inventory
CREATE TABLE Combines_with (
  base_item VARCHAR(100),
  component_item VARCHAR(100),
  PRIMARY KEY (base_item, component_item),
  FOREIGN KEY (base_item) REFERENCES Item(item_name)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (component_item) REFERENCES Item(item_name)
    ON UPDATE CASCADE ON DELETE CASCADE
);
