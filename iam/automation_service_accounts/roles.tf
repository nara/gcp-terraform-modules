resource "google_project_iam_custom_role" "security_role" {
  role_id     = lookup(module.naming_conv.automation_role_name_map, "security")
  title       = lookup(module.naming_conv.automation_role_name_map, "security")
  description = "Role maps to security deploy SA"
  permissions = toset(concat(local.all_permissions_read, local.security_permissions_write))
}

resource "google_project_iam_custom_role" "network_role" {
  role_id     = lookup(module.naming_conv.automation_role_name_map, "network")
  title       = lookup(module.naming_conv.automation_role_name_map, "network")
  description = "Role maps to network deploy SA"
  permissions = toset(concat(local.all_permissions_read, local.network_permissions_write))
}

resource "google_project_iam_custom_role" "db_role" {
  role_id     = lookup(module.naming_conv.automation_role_name_map, "db")
  title       = lookup(module.naming_conv.automation_role_name_map, "db")
  description = "Role maps to DB deploy SA"
  permissions = toset(concat(local.all_permissions_read, local.db_permissions_write))
}

resource "google_project_iam_custom_role" "preglobal_role" {
  role_id     = lookup(module.naming_conv.automation_role_name_map, "preglobal")
  title       = lookup(module.naming_conv.automation_role_name_map, "preglobal")
  description = "Role maps to Pre global deploy SA"
  permissions = toset(concat(local.all_permissions_read, local.db_permissions_write, local.preglobal_permissions_write))
}

resource "google_project_iam_custom_role" "postglobal_role" {
  role_id     = lookup(module.naming_conv.automation_role_name_map, "postglobal")
  title       = lookup(module.naming_conv.automation_role_name_map, "postglobal")
  description = "Role maps to Post global deploy SA"
  permissions = toset(concat(local.all_permissions_read, local.security_permissions_write, local.network_permissions_write,
    local.global_permissions_write,
    local.postglobal_permissions_write))
}

resource "google_project_iam_custom_role" "regional_role" {
  role_id     = lookup(module.naming_conv.automation_role_name_map, "regional")
  title       = lookup(module.naming_conv.automation_role_name_map, "regional")
  description = "Role maps to Regional deploy SA"
  permissions = toset(concat(local.all_permissions_read, local.security_permissions_write, local.network_permissions_write,
    local.service_permissions_write,
    local.regional_permissions_write))
}

resource "google_project_iam_custom_role" "service_role" {
  role_id     = lookup(module.naming_conv.automation_role_name_map, "service")
  title       = lookup(module.naming_conv.automation_role_name_map, "service")
  description = "Role maps to service deploy SA"
  permissions = toset(concat(local.all_permissions_read, local.service_permissions_write))
}