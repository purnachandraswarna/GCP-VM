variable "path" {
  default = "C:\\Users\\Swarna\\Desktop\\GCP\\terraform\\credentials"
}


provider "google" {
  version = "3.5.0"

  credentials = file("${var.path}\\terraform-serviceaccount-key.json")
  project = "prj-b-279820"
  region  = "us-central1"
  zone    = "us-central1-c"
}