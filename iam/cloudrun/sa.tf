resource "google_service_account" "cloud_run_sa" {
  account_id = module.naming_conv.cloud_run_service_account_name
  display_name = module.naming_conv.cloud_run_service_account_name
}

resource "google_service_account_iam_member" "identity_service_account_user" {
  service_account_id = google_service_account.cloud_run_sa.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_project_service_identity.run_identity_sa.email}"
}