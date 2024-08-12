# Enable SSH into the network via Identity Aware Proxy (IAP) (ie, to ssh into a vm)
resource "google_compute_firewall" "allow-iap" {
  name          = "allow-iap"
  network       = google_compute_network.vpc.name
  source_ranges = ["35.235.240.0/20"]
  priority      = 1000
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

# deny all ingress traffic not allowed by a higher priority rule
resource "google_compute_firewall" "deny-all-ingress" {
  name          = "deny-all-ingress"
  network = google_compute_network.vpc.name
  priority      = 65535
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  # Deny all traffic
  deny {
    protocol = "all"
  }
}

# deny all egress traffic not allowed by a higher priority rule
resource "google_compute_firewall" "deny-all-egress" {
  name    = "deny-all-egress"
  network = google_compute_network.vpc.name
  priority = 65535
  direction = "EGRESS"

  deny {
    protocol = "all"
    ports    = []
    }
}

# enable egress for any instances with the 'allow-egress-tag'
resource "google_compute_firewall" "allow-egress-tag" {
  name = "allow-egress-tag"
  network = google_compute_network.vpc.name
  target_tags = ["allow-egress-tag"]
  priority = 65534
  direction = "EGRESS"
  allow {
    protocol = "all" # refine as needed
  }
}

