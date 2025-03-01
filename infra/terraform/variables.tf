variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "hello-world-app"
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "DigitalOcean region to deploy to"
  type        = string
  default     = "nyc3"
}

variable "instance_count" {
  description = "Number of app instances to run"
  type        = number
  default     = 1
}

variable "instance_size_slug" {
  description = "The instance size to use"
  type        = string
  default     = "basic-xxs"
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
}
