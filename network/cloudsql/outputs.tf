output "google_compute_global_address_name"{
    value = var.security_level == "private" ? module.private_connection[0].google_compute_global_address_name : ""
}