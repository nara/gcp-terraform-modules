resource "random_id" "id" {
	  byte_length = 5
}

locals {
  team_or_app_key = var.team_key != "" ? var.team_key : var.app_key

  generic_app_prefix = format("%s-%s-%s", var.line_of_business_key, var.app_key,  var.environment)

  //prj-abc-com-cde-host-dev
  project_name = format("prj-%s-%s-%s-%s-%s", var.org_key, var.line_of_business_key, local.team_or_app_key, var.host_or_service_proj, var.environment)

  //grp-gcp-readonly-abc-com-cde-host-dev AD groups
  group_suffix = format("%s-%s-%s-%s-%s@%s", var.org_key, var.line_of_business_key, local.team_or_app_key, var.host_or_service_proj, var.environment, var.org_email_domain)
  readonly_group_name = format("group:grp-gcp-readonly-%s", local.group_suffix)
  dev_group_name = format("group:grp-gcp-dev-%s", local.group_suffix)
  sre_group_name = format("group:grp-gcp-sre-%s", local.group_suffix)
  audit_group_name = format("group:grp-gcp-audit-%s", local.group_suffix)
  admin_group_name = format("group:grp-gcp-admin-%s", local.group_suffix)

  //service accounts
  service_account_name = format("sa-%s", local.generic_app_prefix)
  //deploy service accounts
  security_app_deploy_service_account = format("${local.service_account_name}-sec-auto")
  network_app_deploy_service_account = format("${local.service_account_name}-network-auto")
  service_app_deploy_service_account = format("${local.service_account_name}-service-auto")
  db_app_deploy_service_account = format("${local.service_account_name}-db-auto")
  preglobal_app_deploy_service_account = format("${local.service_account_name}-pregbl-auto")
  postglobal_app_deploy_service_account = format("${local.service_account_name}-postgbl-auto")
  regional_app_deploy_service_account = format("${local.service_account_name}-regional-auto")

  //deploy role names
  role_name_name = format("role_%s", replace(local.generic_app_prefix, "-", "_"))
  security_app_deploy_role = format("${local.role_name_name}_sec_auto")
  network_app_deploy_role = format("${local.role_name_name}_network_auto")
  service_app_deploy_role = format("${local.role_name_name}_service_auto")
  db_app_deploy_role = format("${local.role_name_name}_db_auto")
  preglobal_app_deploy_role = format("${local.role_name_name}_preglobal_auto")
  postglobal_app_deploy_role = format("${local.role_name_name}_postglobal_auto")
  regional_app_deploy_role = format("${local.role_name_name}_regional_auto")

  //cloud run sa
  cloud_run_service_account_name = format("${local.service_account_name}-run")
  


  //Kms key names
  kms_key_name = format("%s-key", local.generic_app_prefix)
  cloud_run_kms_key_name = format("run-${local.kms_key_name}")
  kms_key_ring_name = format("%s-key-ring-%s", local.generic_app_prefix, random_id.id.hex)
  cloud_run_kms_key_ring_name = format("run-${local.kms_key_ring_name}")

  //networking
  vpc_name = format("%s-%s-%s-%s-vpc", var.line_of_business_key, local.team_or_app_key,  var.environment, var.vpc_postfix)
  enterprise_subnet_name = format("%s-ent-subnet", local.vpc_name)
  serverless_subnet_name = format("%s-svl-subnet", local.vpc_name)
  serverless_vpc_connector_name = format("%s-%s-%s-%s-svl-con", var.line_of_business_key, local.team_or_app_key,  var.environment, var.vpc_postfix)

  //cloud sql instances
  cloud_sql_instance_name =  format("%s-%s-sql", local.generic_app_prefix, var.db_type)

  //cloud run
  serverless_neg_name = format("%s-svl-neg", local.generic_app_prefix)

}