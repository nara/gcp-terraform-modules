module "naming_conv"{
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

module "secret_manager" {
  source  = "GoogleCloudPlatform/secret-manager/google"
  version = "~> 0.1"
  project_id = var.project_id
  secrets = var.secrets
}

# data "google_secret_manager_secret_version" "data_secret" {
#   count = length(local.secret_names)
#   secret = local.secret_names[count.index]
#   depends_on = [
#     module.secret_manager
#   ]
# }

# resource "google_secret_manager_secret_iam_member" "secret_permissions" {
#   for_each = local.sa_secrets
#   #secret_id = data.google_secret_manager_secret_version.data_secret[each.value.name]
#   secret_id = each.value.name
#   role = "roles/secretmanager.secretAccessor"
#   member = "serviceAccount:${module.naming_conv.automation_sa_name_map[each.value.sa_type]}@${var.project_id}.iam.gserviceaccount.com"
#   depends_on = [
#     module.secret_manager
#   ]
# }

# resource "google_secret_manager_secret_iam_member" "compute_default_account" {
#   for_each = local.sa_secrets
#   #secret_id = data.google_secret_manager_secret_version.data_secret[each.value.name]
#   secret_id = each.value.name
#   role = "roles/secretmanager.secretAccessor"
#   member = data.google_compute_default_service_account.default.email
#   depends_on = [
#     module.secret_manager
#   ]
# }

# data "google_compute_default_service_account" "default" {
# }