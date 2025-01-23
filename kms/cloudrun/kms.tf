resource "random_id" "id" {
	  byte_length = 5
}

module "cloud_run_kms" {
  source  = "terraform-google-modules/kms/google"
  version = "~> 2.1"

  project_id           = var.kms_project_id
  location             = var.location
  keyring              = module.naming_conv.cloud_run_kms_key_ring_name
  keys                 = [module.naming_conv.cloud_run_kms_key_name]
  set_decrypters_for   = length(local.decrypters) > 0 ? [module.naming_conv.cloud_run_kms_key_name] : []
  set_encrypters_for   = length(local.encrypters) > 0 ? [module.naming_conv.cloud_run_kms_key_name] : []
  decrypters           = local.decrypters
  encrypters           = local.encrypters
  set_owners_for       = length(var.owners) > 0 ? [module.naming_conv.cloud_run_kms_key_name] : []
  owners               = var.owners
  prevent_destroy      = var.prevent_destroy
  key_rotation_period  = var.key_rotation_period
  key_protection_level = var.key_protection_level
}

# resource "google_kms_crypto_key_iam_member" "crypto_key" {
#   crypto_key_id = module.cloud_run_kms.keys[module.naming_conv.cloud_run_kms_key_name]
#   role          = "roles/cloudkms.cryptoKeyEncrypter"
#   member        = "service-${data.google_project.serverless_project_id.number}@serverless-robot-prod.iam.gserviceaccount.com"
# }
