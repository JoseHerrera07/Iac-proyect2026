terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}


resource "docker_network" "app_network" {
  name = "red_tres_capas"
}

resource "docker_image" "postgres" {
  name         = "postgres:15-alpine"
  keep_locally = true
}

resource "docker_container" "bd" {
  name  = "bd"
  image = docker_image.postgres.image_id
  env   = [
    "POSTGRES_USER=root",
    "POSTGRES_PASSWORD=rootpassword",
    "POSTGRES_DB=db_01"
  ]
  ports {
    internal = 5432
    external = var.bd_port 
  }
  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_image" "api_image" {
  name = "api-java17:latest"
  build {
    context = "${path.module}/../src/api"
  }
}

resource "docker_container" "api" {
  name  = "api01"
  image = docker_image.api_image.image_id
  ports {
    internal = 8080 
    external = var.api_port 
  }
  networks_advanced {
    name = docker_network.app_network.name
  }
  depends_on = [docker_container.bd]
}

resource "docker_image" "web_image" {
  name = "web-nginx:latest"
  build {
    context = "${path.module}/../web"
  }
}

resource "docker_container" "web" {
  name  = "web-LOCAL-01"
  image = docker_image.web_image.image_id
  ports {
    internal = 80
    external = var.web_port 
  }
  networks_advanced {
    name = docker_network.app_network.name
  }
  depends_on = [docker_container.api]
}