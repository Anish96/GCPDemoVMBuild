source = "./network"
resource "google_compute_instance" "vminstance2" {
  name = "second-application-server"
  machine_type = "f1-micro"

  boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
}
 network_interface {
   network = google_compute_network.custom-test.id
 }
}