# 🎮 Game Inventory Management System

A **relational database project** designed for managing in-game inventories, including item ownership, durability, transactions, and crafting mechanics. This system is built for RPGs, survival games, and multiplayer environments where players interact with items dynamically.

## 📌 Features
- **Player Inventory System** – each player has a dedicated inventory.
- **Item Management** – track items with attributes like rarity, type, and durability.
- **Item Instances** – manage unique items with individual properties.
- **Trading System** – track transactions between players.
- **Crafting System** – create new items from predefined materials.
- **Market System** – NPC-based item purchases and sales.
- **Equipment System** – items can be equipped in specific slots (head, body, hands, legs).

📄 **[Full database model](docs/Game_Inventory_DB_Model.md)**

## 🛠️ Technologies Used
- **PostgreSQL** – relational database management.
- **SQL** – database schema design and queries.
- **JPA (Java Persistence API)** – backend integration (optional future enhancement).
- **ERD Diagram** – conceptual model designed with `ER Dia`.

## 🛠️ Setup & Usage
### 📌 Requirements:
- **PostgreSQL** installed
- SQL client (e.g., `pgAdmin` or `DBeaver`)

## 🚀 How to Run
1. Clone the repository:
   ```sh
   git clone https://github.com/yourpunk/game-inventory-system.git
   cd game-inventory-system
2. Set up the PostgreSQL database using the provided schema.
3. (Optional) Run the backend with Spring Boot if you extend the project.

## 📌 Future Enhancements
REST API Integration: Expose inventory management through an API.
User Authentication: Secure player inventory access.
UI for Management: Web interface for tracking and modifying inventory.
Dockerized Deployment: Containerize the system for easier setup.

## 📜 Notes
This was developed as a university group project, but the repository is maintained for educational and portfolio purposes.

## 👥 Contributors
This project was developed as part of a university coursework in database systems. Special thanks to **Aleksandra Soboleva** and **David Lukášek** for their contributions.

### 📩 Feel free to reach out if you have any questions or suggestions!
