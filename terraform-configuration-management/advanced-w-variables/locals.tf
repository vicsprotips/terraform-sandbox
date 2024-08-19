locals {
  # add support for project_id so we can swap between variables and workspaces
  project-id  = var.project-id
  

  # Determine if we're using dev, test, or prod projects
  mode = "${element(split("-", data.google_project.project.name),3)}"

  # bucket
  gcs = {
    name = "my-bucket-${data.google_project.project.name}"
    location = var.region
    }

  # compute engine VMs with dev and test configs
  vms = {
    name = "vicsprotips-${local.mode}"
    dev = {
      zone          = "${var.region}-a"
      machine_type  = "e2-micro"
      boot_disk = {
        initialize_params = {
          image = "debian-cloud/debian-11"
        }
      }
    }
    test = {
      zone          = "${var.region}-b"
      machine_type  = "e2-small"
      boot_disk = {
        initialize_params = {
          image = "debian-cloud/debian-12"
        }
      }
    }
  }
}

data "google_project" "project" {
  project_id = local.project-id
}


