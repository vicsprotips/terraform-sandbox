resource "google_compute_instance" "vm_machine" {
  depends_on    = [ google_compute_network.vpc ]
  project       = local.project-id
  name          = local.vms.name
  zone          = local.vms[local.mode].zone
  machine_type  = local.vms[local.mode].machine_type
  
  boot_disk {
    initialize_params {
      image = local.vms[local.mode].boot_disk.initialize_params.image
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.vpc-subnet.name
  }
}