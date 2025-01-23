locals {
  project      = var.policy_for == "project" ? var.serverless_project_id : ""
  folder       = var.policy_for == "folder" ? var.folder_id : ""
  organization = var.policy_for == "organization" ? var.organization_id : ""
}

# module "cloudrun_allowed_ingress" {
#   source  = "terraform-google-modules/org-policy/google"
#   version = "~> 5.1"

#   policy_for        = var.policy_for
#   project_id        = local.project
#   folder_id         = local.folder
#   organization_id   = local.organization
#   constraint        = "constraints/run.allowedIngress"
#   policy_type       = "list"
#   allow             = ["is:internal-and-cloud-load-balancing"]
#   allow_list_length = 1
# }

# module "cloudrun_allowed_vpc_egress" {
#   source  = "terraform-google-modules/org-policy/google"
#   version = "~> 5.1"

#   policy_for        = var.policy_for
#   project_id        = local.project
#   folder_id         = local.folder
#   organization_id   = local.organization
#   constraint        = "constraints/run.allowedVPCEgress"
#   policy_type       = "list"
#   allow             = ["private-ranges-only"]
#   allow_list_length = 1
# }