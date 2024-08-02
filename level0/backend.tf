terraform {
    backend "gcs" {
        bucket = "vpt-sandbox-tfstate"
        prefix = "terraform/state/sandbox/level0"
    }
}