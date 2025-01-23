output "key_self_link" {
  description = "Key self link."
  value       = module.cloud_run_kms.keys[module.naming_conv.cloud_run_kms_key_name]
}

output "cloud_run_kms_key_name" {
  description = "Key name"
  value       = module.naming_conv.cloud_run_kms_key_name
}

output "keyring_self_link" {
  description = "Self link of the keyring."
  value       = module.cloud_run_kms.keyring
}

output "keyring_resource" {
  description = "Keyring resource."
  value       = module.cloud_run_kms.keyring_resource
}

output "encrypters" {
  value = local.encrypters
}