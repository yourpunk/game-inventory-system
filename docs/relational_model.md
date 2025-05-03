 Relational Model
## 📋 Player
| **Column**              | **Type**              | **Description**     |
|-------------------|---------------------|---------------|
| nickname	|`TEXT`	| **Primary Key** — player ID|
|login |	`TEXT` |	Player login|
|level |	`INT` |	Player level|
|experience |	`INT`	| Total experience|
|gold |	`INT` |	Gold amount|

## 🐉 Pet
| **Column**              | **Type**              | **Description**     |
|-------------------|---------------------|---------------|
|name	| `TEXT` |	**Primary Key** — pet name|
|race	| `TEXT` |	Pet species|
|player	| `TEXT` |	**FK** → Player(nickname) — pet's owner| 

## ✨ Ability
| **Column**              | **Type**              | **Description**     |
|-------------------|---------------------|---------------|
|name |	`TEXT` |	**FK** → Pet(name) — pet name|
|ability | `TEXT` |	Special ability name|

## 🎒 Inventory
| **Column**              | **Type**              | **Description**     |
|-------------------|---------------------|---------------|
|nickname	| `TEXT` |	**FK** → Player(nickname)|
|number | `INT` |	Inventory ID (multiple inventories allowed)|
|capacity	| `INT` |	Max number of items in this inventory|

🔑 Composite **Primary Key**: `(nickname, number)`

## 🧱 Item
| **Column**              | **Type**              | **Description**     |
|-------------------|---------------------|---------------|
|item_name |	`TEXT` |	**Primary Key** — item ID|
|type |	`TEXT` |	Item type (weapon, armor, etc.)|
|cost	| `INT`	| Gold cost|
|rarity	| `TEXT` |	Common / Rare / Epic / Legendary|
|power | `INT` |	Attack bonus|
|stamina	| `INT` |	Stamina bonus|
|defense	| `INT` |	Defense bonus|
|nickname	| `TEXT` |	**FK** → Inventory(nickname)|
|number	| `INT` |	**FK** → Inventory(number)|

## 💰 Transaction
| **Column**              | **Type**              | **Description**     |
|-------------------|---------------------|---------------|
|server	| `TEXT` |	Transaction location|
|time	| `DATETIME`| 	Unique transaction timestamp|
|player	| `TEXT` |	**FK** → Player(nickname)|
|item	| `TEXT` |	**FK** → Item(item_name)|

🔑 Composite **Primary Key**: `(server, time)`

### →🛒 Buying
| **Column**              | **Type**              | **Description**     |
|-------------------|---------------------|---------------|
|server	| `TEXT` |	**FK** → Transaction(server)|
|time	| `DATETIME`	|**FK** → Transaction(time)|
|fee	| `INT`| 	Extra purchase fee (e.g. taxes, shipping)|

### →💸 Selling
| **Column**              | **Type**              | **Description**     |
|-------------------|---------------------|---------------|
|server	| `TEXT` |	**FK** → Transaction(server)|
|time	| `DATETIME`	| **FK** → Transaction(time)|
|merchant_cut	| `INT` |	How much gold the merchant steals from you 😈|

## 🔧 Combines_with
| **Column**              | **Type**              | **Description**     |
|-------------------|---------------------|---------------|
|base_item	| `TEXT` |	**FK** → Item(item_name)|
|component_item |	`TEXT` |	**FK** → Item(item_name)|

🔑 Composite **Primary Key**: `(base_item, component_item)`
