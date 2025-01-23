# provider "google-beta" {
#   billing_project       = data.google_project.main.project_id
#   user_project_override = true
# }

module "admin_group" {
  count = var.create_groups_in_cloud_identity ? 1 : 0
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"
  
  id           = replace(module.naming_conv.admin_group_name, "group:", "")
  display_name = replace(module.naming_conv.admin_group_name, "group:", "")
  description  = "Admin group for app ${var.app_key}"
  domain       = var.org_email_domain
  owners       = []
  managers     = []
  members      = []
}

module "readonly_group" {
  count = var.create_groups_in_cloud_identity ? 1 : 0
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"
  
  id           = replace(module.naming_conv.readonly_group_name, "group:", "")
  display_name = replace(module.naming_conv.readonly_group_name, "group:", "")
  description  = "Readonly group for app ${var.app_key}"
  domain       = var.org_email_domain
  owners       = []
  managers     = []
  members      = []
}

module "audit_group" {
  count = var.create_groups_in_cloud_identity ? 1 : 0
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"
  
  id           = replace(module.naming_conv.audit_group_name, "group:", "")
  display_name = replace(module.naming_conv.audit_group_name, "group:", "")
  description  = "Audit group for app ${var.app_key}"
  domain       = var.org_email_domain
  owners       = []
  managers     = []
  members      = []
}

module "sre_group" {
  count = var.create_groups_in_cloud_identity ? 1 : 0
  source  = "terraform-google-modules/group/google"
  version = "~> 0.1"
  
  id           = replace(module.naming_conv.sre_group_name, "group:", "")
  display_name = replace(module.naming_conv.sre_group_name, "group:", "")
  description  = "SRE group for app ${var.app_key}"
  domain       = var.org_email_domain
  owners       = []
  managers     = []
  members      = []

}