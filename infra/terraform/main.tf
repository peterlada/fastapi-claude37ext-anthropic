terraform {
  backend "s3" {
    // This will be configured via CLI or environment variables
    // Supports DigitalOcean Spaces which is S3-compatible
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_app" "hello_world_app" {
  spec {
    name   = "${var.app_name}-${var.environment}"
    region = var.region

    service {
      name               = var.app_name
      instance_count     = var.instance_count
      instance_size_slug = var.instance_size_slug

      image {
        registry_type = "DOCR"
        repository    = "hello-world-app"
        tag           = var.image_tag
      }

      env {
        key   = "ENVIRONMENT"
        value = var.environment
      }

      health_check {
        http_path = "/"
      }
    }
  }
}

# Create a project for organizing resources
resource "digitalocean_project" "hello_world_project" {
  name        = "${var.app_name}-${var.environment}"
  description = "A project for the Hello World application in ${var.environment} environment"
  purpose     = "Web Application"
  environment = var.environment
  resources   = [digitalocean_app.hello_world_app.urn]
}
