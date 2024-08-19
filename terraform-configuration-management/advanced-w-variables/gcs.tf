resource "google_storage_bucket" "my-bucket" {  
  count     = local.mode == "dev" ? 1 : 0
  project   = local.project-id
  name      = local.gcs.name
  location  = local.gcs.location

  # force_destroy: When deleting a bucket, this boolean option will delete all contained objects. 
  # If you try to delete a bucket that contains objects, Terraform will fail that run.
  force_destroy = true 
  
  uniform_bucket_level_access = true
  public_access_prevention = "enforced"
  autoclass {
    enabled = true
  }
}
