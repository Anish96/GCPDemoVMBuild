resource "google_compute_instance" "vminstance" {
  name = "first-application-server"
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

resource "google_compute_instance" "vminstance2" {
  name = "second-application-server"
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