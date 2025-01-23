output "cloudrun_sa_email" {
  value = google_service_account.cloud_run_sa.email
}

output "cloudrun_identity_email" {
  value = google_project_service_identity.run_identity_sa.email
}