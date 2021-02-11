#GOOGLE_CREDENTIAL environnement variable must be set with a json service account key
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#full-reference
provider "google" {
 project     = var.project
 region      = var.region
}

#run terraform init -backend-config="prefix=DIRECTORY_FOR_BACKEND"
#https://www.terraform.io/docs/language/settings/backends/configuration.html#partial-configuration
terraform {
  backend "gcs" {
   bucket  = "terraform-backends-bucket"
   }
}
