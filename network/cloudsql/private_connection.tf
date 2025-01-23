module "private_connection" {
  count = var.security_level == "private" ? 1 : 0
  source  = "GoogleCloudPlatform/sql-db/google//modules/private_service_access"
  version = "11.0.0"
  project_id = var.project_id
  vpc_network = var.network_name
  address = var.private_access_config.address
  prefix_length = var.private_access_config.prefix_length
  ip_version = var.private_access_config.ip_version
  labels = var.private_access_config.labels
}