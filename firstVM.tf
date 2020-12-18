provider "google" {
  version = "3.5.0"

  project = "ultra-light-298615"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "VM Instance" {
  name = "secondary-application-server"
  machine_type = "f1-micro"

  boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
}
 network_interface {
   network = "default"
}
}