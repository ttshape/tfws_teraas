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

variable "serviceAccount" {
  type = string
  description = "This service account will have the storage.admin role on the bucket that will be created to host the remote state"
}

variable "workspaceName" {
  type = string
  description = "Name of the bucket that will be created to store the remote state"
}
