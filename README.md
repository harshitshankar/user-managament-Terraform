# User Management Microservice

## Description
This is a small **enterprise-style Spring Boot application** that manages users, persists data in MySQL, and publishes events to Kafka. The application is **Dockerized** and can be built and deployed using **Jenkins**.

---

## Prerequisites
- Java JDK 17+
- Maven
- Docker Desktop
- Jenkins
- MySQL 8 (or via Docker Compose)
- Kafka + Zookeeper (via Docker Compose)
- Git
- Postman (for testing APIs)

## terraform init -input=false'
## terraform plan -out=tfplan -input=false
## terraform apply -input=false -auto-approve tfplan

## terraform show

## My personal guide 

terraform init	Initialize Terraform & download Docker provider
terraform plan	See what Terraform will create (preview)
terraform apply -auto-approve	Actually create the containers
terraform show	Display current state (what’s running)
terraform output	Show URLs/ports you exposed
terraform destroy -auto-approve	Stop & remove everything (cleanup)
     
