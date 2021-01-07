provider "google" {
  version = "3.5.0"
  credentials = var.credentials
  project = "ultra-light-298615"
  region  = "us-central1"
  zone    = "us-central1-a"
}
provider "google-beta" {
  credentials = var.credentials
  project = "ultra-light-298615"
  region  = "us-central1"
  zone    = "us-central1-a"
}
