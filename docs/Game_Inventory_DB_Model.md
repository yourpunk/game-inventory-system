# 🎮 Game Inventory Management System - Database Model  

## 📌 Overview  
This document describes the **relational model** for a game inventory system, designed to track player inventories, item transactions, crafting, and marketplace interactions.  

## 📊 Entity-Relationship Model  
### **Entities and Attributes**  

| Entity            | Identifiers                        | Attributes                              |
|------------------|--------------------------------|----------------------------------------|
| **Player**       | `nick`                         | level, experience, gold               |
| **Inventory** (weak) | (`nick`, `inventory_name`)  | capacity                              |
| **PlayerStorage** (inherits Inventory) | (`nick`, `storage_name`)  | max_weight (max item weight)         |
| **Equipment** (inherits Inventory) | (`nick`, `equipment_name`)  | slots (head, body, hands, legs)      |
| **Item**         | `item_name`                         | rarity, type, description, stats      |
| **Transaction**  | `transfer_time`                   | sender, receiver, item                |
| **Crafting**     | `result_item_name`                | resource1, resource2, resource3       |
| **Market**       | `npc_name`, `item_name`   | price                                 |

## 🔄 Relationships  
- **1:1** → Player ↔ PlayerStorage  
- **1:N** → Inventory ↔ Item  
- **N:M** → Player ↔ Transaction (trade system)  
- **Inheritance** → PlayerStorage, Equipment ⊂ Inventory  
- **Weak Entity** → Inventory (depends on Player)  

## 📌 Future Enhancements  
- SQL implementation  
- REST API for inventory management  
- UI for tracking and modifying inventory  

---
