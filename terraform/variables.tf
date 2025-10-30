variable "mysql_root_password" {
  description = "Root password for MySQL database"
  type        = string
  default     = "root"
}

variable "mysql_database" {
  description = "Database name to create in MySQL"
  type        = string
  default     = "userdb"
}

variable "app_port" {
  description = "External port to expose the Spring Boot app"
  type        = number
  default     = 8081
}

variable "kafka_port" {
  description = "Kafka exposed port"
  type        = number
  default     = 9092
}

variable "zookeeper_port" {
  description = "Zookeeper exposed port"
  type        = number
  default     = 2181
}

variable "mysql_host_port" {
  description = "MySQL exposed host port"
  type        = number
  default     = 3307
}

variable "network_name" {
  description = "Docker network name for all containers"
  type        = string
  default     = "user-management"
}

variable "app_image" {
  description = "Docker image for the Spring Boot application"
  type        = string
  default     = "harshitshankar1998/usermgmt-app:latest"
}
