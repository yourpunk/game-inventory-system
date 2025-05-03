# 🐉📦 RPG Inventory Management System

<img src="https://github.com/user-attachments/assets/12f47865-8b5a-4890-916f-8b040040559d" align="right" width="128">

A **database system** for managing player inventories, pets, item transactions and magical item crafting — all wrapped in a fantasy-themed RPG world.

>Originally created as a school project, but it accidentally became a *functional and well-designed relational database*.<br> Whoops. ⸜(｡˃ ᵕ ˂)⸝♡

## ⚔️ Features

- 👥 **Player & pet management** - because dragons are friends, not items
- 🪙 **Gold Transactions** – buying, selling, and no overdrafts
- 🧪 **Item combination mechanics** (yes, you can craft a sword of doom)
- 📊 **Views, Triggers, Constraints**
- 📄 **Structured SQL schema** – full DDL & DML scripts ready to launch
  
<!-- TODO: 🔗 **[ERD + Relational Model](docs/Game_Inventory_DB_Model.md)**  *
🧪 Test cases, queries & sample data included. -->

## 🛠️ Tech Stack

- 🐘 **PostgreSQL** 
- 💾 **SQL** 
- 🌱 **JPA (Java Spring)** – coming soon, once we tame the backend
- 🧠 **ERD Tool** – because we like our relationships visualized

## 🚀 How to Run This Beast

### 🧃 Requirements:
- PostgreSQL (installed and running)
- Your fave SQL client (`pgAdmin`, `DBeaver`, `psql`, whatever works)

### 🪄 Steps:
```bash
git clone https://github.com/yourpunk/game-inventory-system.git
cd game-inventory-system
```
1. Create a new **PostgreSQL** database (name it whatever you want).
2. Run `create_tables.sql` to summon your schema.
3. Optionally insert test data via [`insert_data.sql`](#option-1-manual-insertion-vanilla-sql) or [`generate_data.py`](#option-2-python-generator)
4. Try out queries, triggers & views – live your best DB dev life.

### 🧙‍♀️ Data Generation Options

You’ve got **two ways** to populate this fantasy realm with life:

#### 🧾 Option 1: Manual Insertion (vanilla SQL)

  Use the included SQL script:

```bash
psql -U youruser -d yourdb -f sql/dml_insert_data.sql
```

#### 🐍 Option 2: Python Generator

  Feeling chaotic? Run my *data generator* for 20 players + 32,000 extra transactions:

```bash
cd sql/
python generate_data.py
```
  This will produce `data.sql`, which you can then import:

```bash
psql -U youruser -d yourdb -f data.sql
```
>🪄 **Warning**: this may take a while.<br> Dwarves are typing furiously behind the scenes.

## 🧠 Future Plans (aka side quests)
- 🌐 **REST API** – Spring Boot interface for external use
- 🛡️ **Auth Layer** – limit access to player inventory by login
- 🎨 **Frontend** – React? JavaFX? Who knows. But it’ll look hot
- 🐳 **Docker Support** – one-command setup for lazy legends

## 👤 Author
🚀 Crafted by **Aleksandra Kenig** (aka [yourpunk](https://github.com/yourpunk)) and **[David Lukášek](https://www.linkedin.com/in/david-ddi-luk%C3%A1%C5%A1ek-10ab30343/)**.

💌 Wanna collab or throw some feedback? You know where to find me.
