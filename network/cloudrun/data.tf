module "naming_conv"{
  source = "../../foundation/naming_conv"
  #source = "git::https://github.com/nara/modules.git//gcp/foundation/naming_conv"
  app_key = var.app_key
  environment = var.environment
  host_or_service_proj = var.host_or_service_proj
  line_of_business_key = var.line_of_business_key
  org_email_domain = var.org_email_domain
  org_key = var.org_key
  region = var.location
  team_key = var.team_key
}