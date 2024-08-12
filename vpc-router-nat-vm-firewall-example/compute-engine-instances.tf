# Create a vm with an egress tag
resource "google_compute_instance" "vm-1" {
  depends_on = [ google_compute_network.vpc ]
  project      = var.project-id
  zone         = "us-central1-c"
  name         = "vm-1"
  machine_type = "e2-micro"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.my-vpc-subnet.self_link
  }
  tags = ["allow-egress-tag"]
}

# Create a vm without an egress tag
resource "google_compute_instance" "vm-2" {
  depends_on = [ google_compute_network.vpc ]
  project      = var.project-id
  zone         = "us-central1-c"
  name         = "vm-2"
  machine_type = "e2-micro"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.my-vpc-subnet.self_link
  }
  # tags = ["allow-egress-tag"]
}