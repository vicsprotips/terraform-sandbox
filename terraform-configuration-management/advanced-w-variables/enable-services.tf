resource "google_project_service" "enable-compute-api" {
  project = local.project-id
  service = "compute.googleapis.com"
  timeouts {
    create = "2m"
    update = "2m"
  }
  disable_dependent_services = true
  disable_on_destroy = true
}