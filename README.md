# S2.mysql-structure

# Project Name: Cul d'Ampolla Optician Database
**Description**: Design and implementation of a relational database to manage an optician's business operations, including suppliers, brands, glasses, customers, and sales tracking.

## Statement
Una òptica anomenada «Cul d'Ampolla» vol informatitzar la gestió dels seus clients i la venda d'ulleres. Vol saber el proveïdor de cada parell d'ulleres, les marques vinculades a cada proveïdor, detalls tècnics de les lents i muntures, així com el registre de clients (incloent qui els ha recomanat) i l'empleat que ha realitzat cada venda.

## Features
- **Supplier Management**: Detailed tracking of suppliers (NIF, address, contact) and their exclusive brands.
- **Product Inventory**: Categorization of glasses by brand, prescription (graduation), frame type (floating, plastic, metallic), and colors.
- **Customer CRM**: Database of clients with a recursive relationship to track referrals (who recommended whom).
- **Sales Logging**: Complete history of transactions linking customers, specific glasses, and the responsible employee.

## Tech Stack
- **Database Engine**: MySQL 8.0 / 9.0
- **Modeling Tool**: MySQL Workbench
- **Language**: SQL (Structured Query Language)

## Installation & Execution
1. **Clone the repository**: 
   `git clone https://github.com/YOUR_USERNAME/mysql-estructura.git`
2. **Database Setup**: 
   Open MySQL Workbench and execute the script `solucion_optica.sql`.
3. **Data Loading**: 
   The script automatically creates the schema and populates it with dummy data for testing purposes.
4. **Testing**: 
   Run the `SELECT` queries provided at the end of the SQL file to verify the relational integrity and data cross-referencing.

## Demo
You can find the exported database schema and query results in the main folder of this repository.

## Diagrams & Technical Justification
The relational model follows these architectural decisions:
- **Supplier-Brand Relationship (1:N)**: Each brand is purchased from a single supplier to optimize pricing, as per company policy.
- **Recursive Customer Relationship**: An `id_referrer` foreign key points back to the same `customers` table to manage the referral system without duplicating data.
- **Normalization**: Separated the `brands` table from `glasses` to avoid redundancy and maintain a clean hierarchy between suppliers and products.

(./modelo_relacional_optica.png)
