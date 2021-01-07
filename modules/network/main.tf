resource "google_compute_network" "vpc_network" {
  name = "Test-vpc-network"
  }
subnets = {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"   
}
            route ={
            name                 = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
           # next_hop_internet      = "true"
        }
        
           