module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
   version = "1.7.2"

  name       = "teraas-${var.workspaceName}"
  project_id = var.project
  location   = var.location
  versioning = true
  iam_members = [{
    role   = "roles/storage.admin"
    member = "serviceAccount:${var.serviceAccount}"
  }]
}
