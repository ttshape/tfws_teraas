variable "project" {
  type = string
  default = "adeo-terraform"
}

variable "location" {
  type = string
  default = "europe-west4"
}

variable "region" {
  type = string
  default = "europe-west4-b"
}

variable "service_account_members" {
  type = list(string)
  default=["user:aurelien.pelletier@gmail.com"]
}


variable "service_account_storage_admin" {
  type = string
  default="serviceAccount:teraas@adeo-terraform.iam.gserviceaccount.com"
}



