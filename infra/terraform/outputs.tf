output "app_url" {
  description = "URL of the deployed application"
  value       = digitalocean_app.hello_world_app.default_ingress
}

output "app_id" {
  description = "ID of the deployed application"
  value       = digitalocean_app.hello_world_app.id
}

output "app_updated_at" {
  description = "Last update timestamp"
  value       = digitalocean_app.hello_world_app.updated_at
}

output "app_live_url" {
  description = "Live URL of the deployed application"
  value       = "https://${digitalocean_app.hello_world_app.default_ingress}"
}

output "project_id" {
  description = "ID of the created project"
  value       = digitalocean_project.hello_world_project.id
}
