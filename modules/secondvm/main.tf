resource "google_compute_instance" "vminstance2" {
  # name = "second-application-server"
  count = 2
  machine_type = "f1-micro"

name ="server${count.index}"
  
  boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
}
 network_interface {
  # network = google_compute_network.custom-test.name
  network = test-network
  # subnetwork = google_compute_subnetwork.custom-subnetwork2.name
  subnetwork = test-subnetwork2
 }

 labels = {
    environment = "test_tier"
  }

  }