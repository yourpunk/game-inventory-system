from datetime import datetime, timedelta
import random
from pathlib import Path

# create the necessary blocks for the SQL insert
players = []
inventories = []
items = []
pets = []
abilities = []
transactions = []
buying = []
selling = []
combines_with = []
# data of players, inventories and items
player_inventories = {}  # nickname -> list of inventory numbers
all_items = []  # list of all items for transactions
# base time for transactions
transaction_time = datetime(2025, 4, 1, 0, 0, 0)

# generation of 20 players
for i in range(1, 21):
    nickname = f'Player_{i}'
    login = f'login_{i}'
    level = random.randint(1, 20)
    experience = random.randint(100, 2000)
    gold = random.randint(500, 5000)
    players.append(
        f"INSERT INTO Player (nickname, login, level, experience, gold) VALUES ('{nickname}', '{login}', {level}, {experience}, {gold});"
    )

    # create from 1 to 3 inventories for the player
    inv_numbers = []
    for inv_num in range(1, random.randint(2, 4)):
        capacity = random.randint(5, 20)
        inventories.append(
            f"INSERT INTO Inventory (nickname, number, login, capacity) VALUES ('{nickname}', {inv_num}, '{login}', {capacity});"
        )
        inv_numbers.append(inv_num)

    pet_name = f'Pet_{i}'
    race = random.choice(['cat', 'dog', 'dragon', 'wolf', 'owl', 'frog'])
    pets.append(f"INSERT INTO Pet (name, race, player) VALUES ('{pet_name}', '{race}', '{nickname}');")
    stat = random.choice(['strength', 'speed', 'intelligence', 'agility', 'charisma', 'luck'])
    value = random.randint(1, 10)
    ability = f"{stat}+{value}"
    abilities.append(f"INSERT INTO Ability (name, ability) VALUES ('{pet_name}', '{ability}');")

    for j in range(1, 3):
        item_name = f'Item_{i}_{j}'
        type_ = random.choice(['weapon', 'armor', 'potion', 'ring', 'amulet', 'scroll'])
        cost = random.randint(100, 1000)
        rarity = random.choice(['common', 'rare', 'epic'])
        power = random.randint(10, 50)
        stamina = random.randint(5, 20)
        defense = random.randint(1, 15)
        items.append(
            f"INSERT INTO Item (item_name, type, cost, rarity, power, stamina, defense, nickname, number) "
            f"VALUES ('{item_name}', '{type_}', {cost}, '{rarity}', {power}, {stamina}, {defense}, '{nickname}', {inv_num});"
        )

        # transactions for each item
        server = f'Server_{random.randint(1, 3)}'
        time_str = transaction_time.strftime('%Y-%m-%d %H:%M:%S')
        transactions.append(
            f"INSERT INTO Transaction (server, time, player, item) VALUES ('{server}', '{time_str}', '{nickname}', '{item_name}');"
        )
        if j % 2 == 0:
            fee = random.randint(10, 30)
            buying.append(f"INSERT INTO Buying (server, time, fee) VALUES ('{server}', '{time_str}', {fee});")
        else:
            cut = random.randint(5, 20)
            selling.append(f"INSERT INTO Selling (server, time, merchant_cut) VALUES ('{server}', '{time_str}', {cut});")
        transaction_time += timedelta(seconds=1)

        # item combinations
        if j == 2:
            base_item = f'Item_{i}_1'
            component_item = f'Item_{i}_2'
            combines_with.append(
                f"INSERT INTO Combines_with (base_item, component_item) VALUES ('{base_item}', '{component_item}');"
            )

# add another 32000 additional transactions, distributed between players and existing items
existing_items = [f'Item_{i}_{j}' for i in range(1, 21) for j in range(1, 3)]
for k in range(1, 32001):
    player_id = (k % 20) + 1
    nickname = f'Player_{player_id}'
    item_name = random.choice(existing_items)
    server = f'Server_{random.randint(1, 3)}'
    time_str = transaction_time.strftime('%Y-%m-%d %H:%M:%S')
    transactions.append(
        f"INSERT INTO Transaction (server, time, player, item) VALUES ('{server}', '{time_str}', '{nickname}', '{item_name}');"
    )
    if k % 2 == 0:
        fee = random.randint(10, 30)
        buying.append(f"INSERT INTO Buying (server, time, fee) VALUES ('{server}', '{time_str}', {fee});")
    else:
        cut = random.randint(5, 20)
        selling.append(f"INSERT INTO Selling (server, time, merchant_cut) VALUES ('{server}', '{time_str}', {cut});")
    transaction_time += timedelta(seconds=1)

# save
full_sql = "\n".join(players + inventories + pets + abilities + items + transactions + buying + selling + combines_with)
output_path = Path("./data.sql")
output_path.write_text(full_sql)

output_path
