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

---

## Setup

### 1. Start MySQL + Kafka via Docker Compose
```bash
docker-compose up -d
