resource "google_compute_network" "vpc" {
  depends_on              = [ google_project_service.enable-compute-api ]
  project                 = local.project-id
  name                    = var.vpc-name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc-subnet" {
  depends_on    = [ google_compute_network.vpc ]
  project       = local.project-id
  name          = "${var.vpc-name}-${var.region}"  
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
}