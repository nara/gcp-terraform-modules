locals {
  subnet_name = var.create_subnet ? module.naming_conv.serverless_subnet_name : var.subnet_name
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
  count = var.create_subnet ? 1 : 0

  name                     = local.subnet_name
  project                  = var.vpc_project_id
  network                  = var.shared_vpc_name
  ip_cidr_range            = var.ip_cidr_range
  region                   = var.location
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = var.flow_sampling
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

module "serverless_connector" {
  source  = "terraform-google-modules/network/google//modules/vpc-serverless-connector-beta"
  version = "~> 5.0"

  project_id = var.connector_on_host_project ? var.vpc_project_id : var.serverless_project_id
  vpc_connectors = [{
    name            = module.naming_conv.serverless_vpc_connector_name
    region          = var.location
    subnet_name     = local.subnet_name
    host_project_id = var.vpc_project_id
    machine_type    = "e2-micro"
    min_instances   = 2
    max_instances   = 7
    max_throughput  = 700
    }
  ]
  depends_on = [
    google_compute_subnetwork.vpc_subnetwork
  ]
}