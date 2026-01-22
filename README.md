# S2.01.MYSQL_data_structure-Pizzeria

## Statement of the exercise
The goal is to design a database for a food delivery web service that manages customers, orders, products, and staff across different store locations.
Customers & Locations: Store personal details, including a unique ID, name, address, and phone. Locations are normalized into separate Provinces and Localities tables ($1:N$ relationship).
Orders: Track date/time, delivery type (home delivery or store pickup), product quantities, and total price. 
Each order is linked to one customer and one store.
Products & Categories: Products include Pizzas, Burgers, and Beverages (name, description, image, and price). Pizzas belong to specific categories that can change over time.
Stores & Employees: Each store has its own address and location data. Employees are linked to a single store and categorized as either Cooks or Delivery Drivers.
Delivery Tracking: For home deliveries, the system must record the specific delivery driver assigned and the exact date/time of the delivery.

## Features Relational 
Mapping: Complex $1:N$ and $N:M$ relationships between customers, orders, and products.
Product Categorization: Dynamic pizza categories to allow for seasonal menu changes.
Logistics Management: Integration of store locations and employee roles within the ordering workflow.
Geographic Normalization: Multi-level geographic data (Locality -> Province) to prevent data redundancy.
Temporal Tracking: Logging precise timestamps for both order placement and final delivery.

## Technologies
Database: MySQL / MariaDBModeling: MySQL Workbench (EER Diagram)
Language: SQL

## Installation & Execution
Clone the repository
Import the Schema:Launch MySQL Workbench.Go to File > Open SQL Script and select the provided .sql file.
Execute the script to build the schema.

## Database 
Visualization:Open the .mwb file to inspect the Entity-Relationship Diagram.
DemoThe database is optimized to handle queries such as: Retrieving all home deliveries assigned to a specific driver.
Calculating the total revenue for a specific store location.
Listing all products included in a single customer order.
Filtering pizzas by their current seasonal category.

## Diagrams & Technical Decisions
Separation of Concerns: Localities and Provinces are placed in separate tables to ensure $3^{rd}$ Normal Form (3NF), reducing data entry errors in addresses.Role-Based 
Logic: The employee table uses a "Type" attribute (Cook/Driver) to control logistics logic, ensuring only drivers are assigned to delivery tasks.
Product Hierarchy: A unified Products table is used with a type discriminator, while a separate Categories table handles the specific business logic for Pizzas.Order-Product Relationship: An associative table (Order_Items) manages the many-to-many relationship between orders and products, storing the specific quantity of each item.
