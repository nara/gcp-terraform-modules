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

#security sa
resource "google_service_account" "auto_security_sa" {
  account_id = module.naming_conv.security_app_deploy_service_account
  display_name = module.naming_conv.security_app_deploy_service_account
}

resource "google_project_iam_member" "auto_security_sa_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.security_role.id
  member  = google_service_account.auto_security_sa.member
}

#network sa
resource "google_service_account" "auto_network_sa" {
  account_id = module.naming_conv.network_app_deploy_service_account
  display_name = module.naming_conv.network_app_deploy_service_account
}

resource "google_project_iam_member" "auto_network_sa_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.network_role.id
  member  = google_service_account.auto_network_sa.member
}

resource "google_project_iam_member" "auto_network_sa_role_vpc_access" {
  count = contains(var.capabilities, "serverless_connector") ? 1 : 0
  project = var.project_id
  role    = "roles/vpcaccess.admin"
  member  = google_service_account.auto_network_sa.member
}

#db sa
resource "google_service_account" "auto_db_sa" {
  account_id = module.naming_conv.db_app_deploy_service_account
  display_name = module.naming_conv.db_app_deploy_service_account
}

resource "google_project_iam_member" "auto_db_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.db_role.id
  member  = google_service_account.auto_db_sa.member
}

#preglobal sa
resource "google_service_account" "preglobal_app_sa" {
  account_id = module.naming_conv.preglobal_app_deploy_service_account
  display_name = module.naming_conv.preglobal_app_deploy_service_account
}

resource "google_project_iam_member" "preglobal_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.preglobal_role.id
  member  = google_service_account.preglobal_app_sa.member
}

resource "google_project_iam_member" "auto_preglobal_sa_role_vpc_access" {
  count = contains(var.capabilities, "serverless_connector") ? 1 : 0
  project = var.project_id
  role    = "roles/vpcaccess.user"
  member  = google_service_account.preglobal_app_sa.member
}

resource "google_project_iam_member" "auto_preglobal_sa_role_dns_admin" {
  count = contains(var.capabilities, "serverless_connector") ? 1 : 0
  project = var.project_id
  role    = "roles/dns.admin"
  member  = google_service_account.preglobal_app_sa.member
}

#postglobal sa
resource "google_service_account" "postglobal_app_sa" {
  account_id = module.naming_conv.postglobal_app_deploy_service_account
  display_name = module.naming_conv.postglobal_app_deploy_service_account
}

resource "google_project_iam_member" "postglobal_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.postglobal_role.id
  member  = google_service_account.postglobal_app_sa.member
}

resource "google_project_iam_member" "auto_postglobal_sa_role_vpc_access" {
  count = contains(var.capabilities, "serverless_connector") ? 1 : 0
  project = var.project_id
  role    = "roles/vpcaccess.user"
  member  = google_service_account.postglobal_app_sa.member
}

resource "google_project_iam_member" "auto_postglobal_sa_role_dns_admin" {
  count = contains(var.capabilities, "serverless_connector") ? 1 : 0
  project = var.project_id
  role    = "roles/dns.admin"
  member  = google_service_account.postglobal_app_sa.member
}

#regional sa
resource "google_service_account" "regional_app_sa" {
  account_id = module.naming_conv.regional_app_deploy_service_account
  display_name = module.naming_conv.regional_app_deploy_service_account
}

resource "google_project_iam_member" "regional_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.regional_role.id
  member  = google_service_account.regional_app_sa.member
}

resource "google_project_iam_member" "auto_regional_sa_role_vpc_access" {
  count = contains(var.capabilities, "serverless_connector") ? 1 : 0
  project = var.project_id
  role    = "roles/vpcaccess.admin"
  member  = google_service_account.regional_app_sa.member
}

resource "google_project_iam_member" "auto_regional_sa_role_dns_admin" {
  count = contains(var.capabilities, "serverless_connector") ? 1 : 0
  project = var.project_id
  role    = "roles/dns.admin"
  member  = google_service_account.regional_app_sa.member
}

resource "google_project_iam_member" "auto_regional_sa_role_cloud_run" {
  count = contains(var.capabilities, "cloudrun") ? 1 : 0
  project = var.project_id
  role    = "roles/run.admin"
  member  = google_service_account.regional_app_sa.member
}

resource "google_project_iam_member" "auto_regional_sa_role_cloud_run_svc_agent" {
  count = contains(var.capabilities, "cloudrun") ? 1 : 0
  project = var.project_id
  role    = "roles/run.serviceAgent"
  member  = google_service_account.regional_app_sa.member
}

#service sa
resource "google_service_account" "service_app_sa" {
  account_id = module.naming_conv.service_app_deploy_service_account
  display_name = module.naming_conv.service_app_deploy_service_account
}

resource "google_project_iam_member" "service_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.service_role.id
  member  = google_service_account.service_app_sa.member
}

resource "google_project_iam_member" "auto_service_sa_role_vpc_access" {
  count = contains(var.capabilities, "serverless_connector") ? 1 : 0
  project = var.project_id
  role    = "roles/vpcaccess.user"
  member  = google_service_account.service_app_sa.member
}

resource "google_project_iam_member" "auto_service_sa_role_cloud_run" {
  count = contains(var.capabilities, "cloudrun") ? 1 : 0
  project = var.project_id
  role    = "roles/run.admin"
  member  = google_service_account.service_app_sa.member
}

resource "google_project_iam_member" "auto_service_sa_role_cloud_run_svc_agent" {
  count = contains(var.capabilities, "cloudrun") ? 1 : 0
  project = var.project_id
  role    = "roles/run.serviceAgent"
  member  = google_service_account.service_app_sa.member
}

data "google_compute_default_service_account" "default" {
}

# resource "google_project_iam_member" "compute_secret_access" {
#   count = contains(var.capabilities, "cloudrun") ? 1 : 0
#   project = var.project_id
#   role    = "roles/secretmanager.secretAccessor"
#   member  = data.google_compute_default_service_account.default.email
# }
