locals {
  # Determine if we're using dev, test, or prod projects
  mode = "${element(split("-", data.google_project.project.name),3)}" 
}

data "google_project" "project" {
  project_id = var.project-id
}


