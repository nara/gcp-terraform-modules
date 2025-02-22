resource "google_secret_manager_secret" "secret-basic" {
  secret_id = var.secret_name

  labels = var.label

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "secret-version-basic" {
  secret = google_secret_manager_secret.secret-basic.id
  secret_data = var.secret_data
}