provider "google" {
    project = var.gcp-project
    region  = var.region
    # zone    = var.zone
}


# provider "google" {
#     project = "${terraform.workspace}"
#     region  = var.region
#     # zone    = var.zone
# }

# provider "google-beta" {
#   project = "${terraform.workspace}"
#   region  = var.region
#   # zone    = var.zone
# }