resource "google_compute_network" "vpc" {
  count                   = local.mode == "dev" ? 1 : 0 # only create if mode matches string
  depends_on              = [ google_project_service.enable-compute-api ]
  project                 = var.project-id
  name                    = var.vpc-name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc-subnet" {
  depends_on    = [ google_compute_network.vpc ]
  count         = local.mode == "dev" ? 1 : 0 # only create if mode matches string
  project       = var.project-id
  name          = "${var.vpc-name}-${var.region}"  
  network       = google_compute_network.vpc[count.index].id
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
}