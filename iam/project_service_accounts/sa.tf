data "google_project" "main" {
  project_id = var.project_id
}

module "naming_conv" {
  source = "../../foundation/naming_conv"
  #source = "git::https://github.com/nara/modules.git//gcp/foundation/naming_conv"
  app_key = var.app_key
  environment = var.environment
  host_or_service_proj = var.host_or_service_proj
  line_of_business_key = var.line_of_business_key
  org_email_domain = var.org_email_domain
  org_key = var.org_key
  region = var.region
  team_key = var.team_key
}

resource "google_project_iam_member" "admin_group_access" {
  member  = module.naming_conv.admin_group_name
  project = data.google_project.main.project_id
  role    = "roles/owner"
  depends_on = [
    module.admin_group
  ]
}

resource "google_project_iam_member" "readonly_group_access" {
  member  = module.naming_conv.readonly_group_name
  project = data.google_project.main.project_id
  role    = "roles/viewer"
  depends_on = [
    module.readonly_group
  ]
}

resource "google_project_iam_member" "audit_group_access" {
  member  = module.naming_conv.audit_group_name
  project = data.google_project.main.project_id
  role    = "roles/viewer"
  depends_on = [
    module.audit_group
  ]
}

