resource "google_project_service" "service" {
  for_each = toset(var.apis)

  project                    = var.project_id
  service                    = each.key
  disable_dependent_services = var.disable_dependent_services
  disable_on_destroy         = var.disable_on_destroy

  timeouts {
    create = try(var.timeouts.create, null)
    read   = try(var.timeouts.read, null)
    update = try(var.timeouts.update, null)
    delete = try(var.timeouts.delete, null)
  }
}