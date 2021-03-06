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



        
           