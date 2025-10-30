resource "docker_network" "user_management" {
  name = var.network_name
}

resource "docker_container" "userdb" {
  name  = "userdb"
  image = "mysql:8.0.39"

  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=${var.mysql_database}"
  ]

  ports {
    internal = 3306
    external = var.mysql_host_port
  }

  networks_advanced {
    name = docker_network.user_management.name
  }

  restart = "always"
}

resource "docker_container" "zookeeper" {
  name  = "zookeeper"
  image = "confluentinc/cp-zookeeper:7.4.4"

  env = [
    "ZOOKEEPER_CLIENT_PORT=${var.zookeeper_port}",
    "ZOOKEEPER_TICK_TIME=2000"
  ]

  ports {
    internal = var.zookeeper_port
    external = var.zookeeper_port
  }

  networks_advanced {
    name = docker_network.user_management.name
  }

  restart = "always"
}

resource "docker_container" "kafka" {
  name  = "kafka"
  image = "confluentinc/cp-kafka:7.4.4"

  depends_on = [docker_container.zookeeper]

  env = [
    "KAFKA_ZOOKEEPER_CONNECT=zookeeper:${var.zookeeper_port}",
    "KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:${var.kafka_port}",
    "KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:${var.kafka_port}",
    "KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1"
  ]

  ports {
    internal = var.kafka_port
    external = var.kafka_port
  }

  networks_advanced {
    name = docker_network.user_management.name
  }

  restart = "always"
}

resource "docker_container" "usermgmt_app" {
  name  = "usermgmt-app"
  image = var.app_image

  depends_on = [docker_container.kafka]

  ports {
    internal = 8080
    external = var.app_port
  }

  networks_advanced {
    name = docker_network.user_management.name
  }

  restart = "always"

  env = [
    "SPRING_DATASOURCE_URL=jdbc:mysql://userdb:3306/${var.mysql_database}?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
    "SPRING_DATASOURCE_USERNAME=root",
    "SPRING_DATASOURCE_PASSWORD=${var.mysql_root_password}",
    "SPRING_KAFKA_BOOTSTRAP_SERVERS=kafka:${var.kafka_port}"
  ]
}
