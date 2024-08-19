# variable "project-id" {
#   NOTE: Not needed since we're using workspaces!!!!!!!!!!
#     type = string
#     description = "GCP Project ID to use, ie vpt-tf-sandbox-dev | vpt-tf-sandbox-test"
# }

variable "region" {
    type = string
    description = "Specify a region, ie, us-central1 | us-east1 | ..."
    default = "us-west1"
}

variable "vpc-name" {
    type = string
    description = "Specify the name of the vpc to be created, ie awesome-vpc"
    default = "awesome-vpc"
}
