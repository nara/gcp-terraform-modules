output "project_name" {
  value = local.project_name
}

output "readonly_group_name" {
  value = local.readonly_group_name
}

output "dev_group_name" {
  value = local.dev_group_name
}

output "sre_group_name" {
  value = local.sre_group_name
}

output "audit_group_name" {
  value = local.audit_group_name
}

output "admin_group_name" {
  value = local.admin_group_name
}

output "service_account_name" {
  value = local.service_account_name
}

output "cloud_run_service_account_name" {
  value = local.cloud_run_service_account_name
}

output "cloud_run_kms_key_name" {
  value = local.cloud_run_kms_key_name
}

output "cloud_run_kms_key_ring_name" {
  value = local.cloud_run_kms_key_ring_name
}

output "vpc_name" {
  value = local.vpc_name
}

output "enterprise_subnet_name" {
  value = local.enterprise_subnet_name
}

output "serverless_subnet_name" {
  value = local.serverless_subnet_name
}

output "serverless_vpc_connector_name" {
  value = local.serverless_vpc_connector_name
}

output "cloud_sql_instance_name" {
  value = local.cloud_sql_instance_name
}

output "serverless_neg_name" {
  value = local.serverless_neg_name
}

output "generic_app_prefix" {
  value = local.generic_app_prefix
}

output "security_app_deploy_service_account" {
  value = local.security_app_deploy_service_account
}

output "network_app_deploy_service_account" {
  value = local.network_app_deploy_service_account
}

output "service_app_deploy_service_account" {
  value = local.service_app_deploy_service_account
}

output "db_app_deploy_service_account" {
  value = local.db_app_deploy_service_account
}

output "preglobal_app_deploy_service_account" {
  value = local.preglobal_app_deploy_service_account
}

output "postglobal_app_deploy_service_account" {
  value = local.postglobal_app_deploy_service_account
}

output "regional_app_deploy_service_account" {
  value = local.regional_app_deploy_service_account
}


output "automation_sa_name_map" {
  value = {
    "security" = local.security_app_deploy_service_account,
    "network" = local.network_app_deploy_service_account,
    "service" = local.service_app_deploy_service_account,
    "db" = local.db_app_deploy_service_account,
    "preglobal" = local.preglobal_app_deploy_service_account,
    "postglobal" = local.postglobal_app_deploy_service_account,
    "regional" = local.regional_app_deploy_service_account,
  }
}

output "automation_role_name_map" {
  value = {
    "security" = local.security_app_deploy_role,
    "network" = local.network_app_deploy_role,
    "service" = local.service_app_deploy_role,
    "db" = local.db_app_deploy_role,
    "preglobal" = local.preglobal_app_deploy_role,
    "postglobal" = local.postglobal_app_deploy_role,
    "regional" = local.regional_app_deploy_role,
  }
}