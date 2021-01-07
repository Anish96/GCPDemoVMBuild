#---- Create cutom Netwrok ---

resource "google_compute_network" "custom-test" {
  name                    = "test-network"
  auto_create_subnetworks = false
}

#---- create custom 2 sub-network ------

resource "google_compute_subnetwork" "custom-subnetwork" {
  name          = "test-subnetwork1"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.custom-test.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
    }
resource "google_compute_subnetwork" "custom-subnetwork2" {
  name          = "test-subnetwork2"
  ip_cidr_range = "10.3.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.custom-test.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.167.10.0/24"
  }
  }

#---- Create firewall ---

resource "google_compute_firewall" "custom-firewall" {
  name    = "test-firewall"
  network = google_compute_network.custom-test.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  source_tags = ["web"]
}

#-----Create Compute Engine -----

resource "google_compute_instance" "vminstance2" {
  name = "second-application-server"
  machine_type = "f1-micro"

  boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
}
 network_interface {
   network = google_compute_network.custom-test.name
   subnetwork = google_compute_subnetwork.custom-subnetwork2.name
 }

 labels = {
    environment = "test_tier"
  }
 
}


#--- Create additonal disk ---

resource "google_compute_disk" "default" {
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  image = "debian-9-stretch-v20200805"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}

#---- attach disk to comput engine ----

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default.id
  instance = google_compute_instance.vminstance2.id
}

# -------create Compute engine using image  -----

resource "google_compute_instance_from_machine_image" "vminstance3" { 
  provider     = google-beta
  name     =  "Third-application-server"
  zone     = "us-central1-a"

  source_machine_image = "projects/ultra-light-298615/global/images/test-vm"
}
        
           