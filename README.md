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
