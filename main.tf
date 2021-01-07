module "firstvm" {
    #source = "./modules/firstvm"
    source = "./modules/network"
    #source = "./modules/secondvm"
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
   network = test.network
 }
}