resource "google_project_service" "enable-compute-api" {
  project = var.project-id
  service = "compute.googleapis.com"
  timeouts {
    create = "2m"
    update = "2m"
  }
  disable_dependent_services = false
  disable_on_destroy = false
}