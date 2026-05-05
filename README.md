# My Website

This is a simple web application built with PHP, MySQL, and Docker.  
It runs in a containerized environment using Docker Compose.

## Tech Stack
- PHP 8.2 (Apache)
- MySQL 8
- Docker & Docker Compose
- HTML / CSS / JavaScript


## Run

### 1. Clone the repository
git clone https://github.com/Anhelyna/my-working-website.git
cd my-working-website

#### 1.1 This project uses a MySQL database.
Host: db
User: root
Password: root
Database name: mydb

##### 1.1.1 Import the tables
docker exec -i your_db_container_name mysql -u root -proot mydb < table.sql

### 2. Start containers
`bash
docker-compose up --build

### 3. Open in browser
http://localhost:8080


## Docker services
### Web Server (PHP + Apache)
Runs on port: 8080

### Database (MySQL)
Runs on port: 3306

## Programming Examples

This repository includes selected examples of my work in:

### **Assembly Language**  
Low-level programming, memory operations, and system-level logic  

### **C Programming**  
Systems programming, process management (fork, pipes), and parallel/concurrent computation. Includes lab work focused on low-level problem solving and performance-oriented design.  

### **C++**  
Object-oriented and procedural programming, memory management, and performance-focused applications 

### **C#**  
Application development using .NET, including GUI-based projects and object-oriented design

### **Java**  
Object-oriented programming, data structures, and application development  

### **SQL**  
Database design, querying, data manipulation, and relational database management

### **R5RS (Scheme)**  
Functional programming concepts, recursion, and symbolic computation  

All projects were completed as part of my academic coursework, including lab assignments and practical implementations.