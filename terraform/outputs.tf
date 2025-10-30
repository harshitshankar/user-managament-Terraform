output "application_url" {
  value = "http://localhost:${var.app_port}/app/users"
}

output "mysql_port" {
  value = "localhost:${var.mysql_host_port}"
}

output "kafka_port" {
  value = "localhost:${var.kafka_port}"
}

output "zookeeper_port" {
  value = "localhost:${var.zookeeper_port}"
}
