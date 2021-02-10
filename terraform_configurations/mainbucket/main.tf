
resource "google_service_account" "teraas_service_account" {
  account_id   = "teraas"
  display_name = "Service Account used by teraas to run terraform"
}

data "google_iam_policy" "teraas" {
  binding {
    role = "roles/iam.serviceAccountUser"

    members = var.service_account_members
  }
  binding {
    role = "roles/iam.serviceAccountTokenCreator"

    members = var.service_account_members
  }
}

resource "google_service_account_iam_policy" "teraas-account-iam" {
  service_account_id = google_service_account.teraas_service_account.name
  policy_data        = data.google_iam_policy.teraas.policy_data
}


module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
   version = "1.7.2"

  name       = "teraform-backends-bucket"
  project_id = "adeo-terraform"
  location   = var.location
  versioning = true
  iam_members = [{
    role   = "roles/storage.admin"
    member = var.service_account_storage_admin
  }]
}
