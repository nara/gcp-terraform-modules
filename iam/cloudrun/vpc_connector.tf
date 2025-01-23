data "google_project" "serverless_project_id" {
  project_id = var.serverless_project_id
}

resource "google_project_service_identity" "vpcaccess_identity_sa" {
  provider = google-beta

  project = var.serverless_project_id
  service = "vpcaccess.googleapis.com"
}

resource "google_project_service_identity" "run_identity_sa" {
  provider = google-beta

  project = var.serverless_project_id
  service = "run.googleapis.com"
}

resource "google_project_iam_member" "gca_sa_vpcaccess" {
  count = var.with_vpc_connector && var.connector_on_host_project ? 0 : 1

  project = var.vpc_project_id
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${google_project_service_identity.vpcaccess_identity_sa.email}"
}

resource "google_project_iam_member" "cloud_services" {
  count = var.with_vpc_connector && var.connector_on_host_project ? 0 : 1

  project = var.vpc_project_id
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${data.google_project.serverless_project_id.number}@cloudservices.gserviceaccount.com"
}

resource "google_project_iam_member" "run_identity_services" {
  count = var.with_vpc_connector && var.connector_on_host_project ? 0 : 1

  project = var.vpc_project_id
  role    = "roles/vpcaccess.user"
  member  = "serviceAccount:${google_project_service_identity.run_identity_sa.email}"
}

