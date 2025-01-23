locals {
  roles_serverless_administrator          = ["roles/run.admin", "roles/compute.networkViewer", "roles/compute.networkUser"]
  roles_serverless_security_administrator = ["roles/run.viewer", "roles/cloudkms.viewer", "roles/artifactregistry.reader"]
  roles_group_cloud_run_developer         = ["roles/run.developer", "roles/artifactregistry.writer", "roles/cloudkms.cryptoKeyEncrypter"]
  roles_group_cloud_run_user              = ["roles/run.invoker"]
}

resource "google_project_iam_member" "group_serverless_administrator_run_admin" {
  for_each = toset(local.roles_serverless_administrator)

  project = var.serverless_project_id
  role    = each.value
  member  = module.naming_conv.admin_group_name
  
}

resource "google_project_iam_member" "group_cloud_run_developer_run_developer" {
  for_each = var.kms_project_id != var.serverless_project_id ? toset(local.roles_group_cloud_run_developer) : []

  project = var.kms_project_id
  role    = each.value
  member  = module.naming_conv.admin_group_name
}

resource "google_project_iam_member" "group_cloud_run_user_run_invoker" {
  for_each = toset(local.roles_group_cloud_run_user)

  project = var.serverless_project_id
  role    = each.value
  member  = module.naming_conv.sre_group_name
}