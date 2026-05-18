terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

# -----------------------------
# Docker Network
# -----------------------------
resource "docker_network" "app_network" {
  name = "app-network"
}

# -----------------------------
# Node.js App Image
# -----------------------------
resource "docker_image" "devops_app_image" {
  name = "devops-app:latest"
  build {
    context = "../app"
  }
}

# -----------------------------
# Node.js App Container
# -----------------------------
resource "docker_container" "devops_app" {
  name  = "devops-app"
  image = docker_image.devops_app_image.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 3000
    external = 3000
  }
}

# -----------------------------
# Nginx Image
# -----------------------------
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# -----------------------------
# Nginx Container
# -----------------------------
resource "docker_container" "nginx" {
  name  = "terraform-nginx"
  image = docker_image.nginx_image.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 80
    external = 8081
  }

  volumes {
    host_path      = abspath("${path.module}/nginx/default.conf")
    container_path = "/etc/nginx/conf.d/default.conf"
  }

  depends_on = [
    docker_container.devops_app
  ]
}