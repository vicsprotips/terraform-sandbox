variable "project-id" {
  type = string
  description = "GCP project-id to deploy to"
  # default = "sandbox-431116"
}

variable "region" {
  default = "us-central1"
}

variable "vpc-name" {
  default = "my-sandbox-vpc"
}

