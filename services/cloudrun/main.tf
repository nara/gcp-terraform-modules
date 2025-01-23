#cloud run service
#security kms
#alb

module "cloud_run_core" {
  source                                  = "GoogleCloudPlatform/cloud-run/google"
  version = "~> 0.3.0"
  argument = var.argument
  certificate_mode = var.certificate_mode
  container_command = var.container_command
  container_concurrency = var.container_concurrency
  domain_map_annotations = var.domain_map_annotations
  domain_map_labels = var.domain_map_labels
  encryption_key = var.encryption_key
  env_secret_vars = var.env_secret_vars
  env_vars = var.env_vars
  force_override = var.force_override
  generate_revision_name = var.generate_revision_name
  image = var.image
  limits = var.limits
  location = var.location
  members = var.members
  ports = var.ports
  project_id = var.project_id
  requests = var.requests
  service_account_email = var.service_account_email
  service_annotations = var.service_annotations
  service_labels = var.service_labels
  service_name = format("%s-%s", module.naming_conv.generic_app_prefix, var.service_name)
  template_annotations = var.template_annotations
  template_labels = var.template_labels
  timeout_seconds = var.timeout_seconds
  traffic_split = var.traffic_split
  verified_domain_name = var.verified_domain_name
  volume_mounts = var.volume_mounts
  volumes = var.volumes
}

resource "google_compute_region_network_endpoint_group" "serverless_neg" {
  count = var.with_alb ? 1 : 0
  provider              = google-beta
  name                  = module.naming_conv.serverless_neg_name
  project               = var.project_id
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_run {
    service = module.cloud_run_core.service_name
  }
  depends_on = [
    module.cloud_run_core
  ]
}

resource "google_cloud_run_service_iam_binding" "unauthenticated" {
  count = var.allow_unauthenticated ? 1 : 0
  location = module.cloud_run_core.location
  service  = module.cloud_run_core.service_name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
  depends_on = [
    module.cloud_run_core
  ]
}