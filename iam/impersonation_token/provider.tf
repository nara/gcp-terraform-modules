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

locals {
  terraform_service_account = "${lookup(module.naming_conv.automation_sa_name_map, var.token_for)}@${var.project_id}.iam.gserviceaccount.com"
}

provider "google" {
 alias = "impersonation"
 scopes = [
   "https://www.googleapis.com/auth/cloud-platform",
   "https://www.googleapis.com/auth/userinfo.email",
 ]
}

data "google_client_config" "default" {
  provider = google.impersonation
}

data "google_service_account_access_token" "default" {
 provider               	= google.impersonation
 target_service_account 	= local.terraform_service_account
 scopes                 	= ["userinfo-email", "cloud-platform"]
 lifetime               	= var.token_lifetime
}

terraform {
  required_version = ">= 0.12"

  backend "gcs" {
  }
}