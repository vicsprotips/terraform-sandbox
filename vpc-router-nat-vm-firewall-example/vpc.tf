resource "google_compute_network" "vpc" {
  depends_on = [ google_project_service.enable-compute-api ]
  name = var.vpc-name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-vpc-subnet" {
  name          = "${var.vpc-name}-${var.region}"
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
}

resource "google_compute_router" "router" {
  name    = "${var.vpc-name}-router"
  region  = google_compute_subnetwork.my-vpc-subnet.region
  network = google_compute_network.vpc.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.vpc-name}-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}