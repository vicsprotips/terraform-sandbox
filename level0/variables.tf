
variable "gcp-project" {
    type = string
    description = "GCP Project to use, ie sandbox"
}

variable "region" {
    type = string
    description = "Specify a region, ie, us-central1 | us-east1 | ..."
}

variable "vpc-name" {
    type = string
    description = "Specify the name of the vpc to be created, ie my-vpc"
}
