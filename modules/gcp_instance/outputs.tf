output "instance_id" {
    description = "ID of the Compute Engine instance"
    value       = google_compute_instance.app_server.id
}

output "instance_public_ip" {
    description = "Public IP address of the Compute Engine instance"
    value       = google_compute_instance.app_server.network_interface.0.access_config.0.nat_ip
}