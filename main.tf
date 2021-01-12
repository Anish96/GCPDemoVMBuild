module "network" {
  source = "./modules/network"    
}

module "vmbuild" {
    #source = "./modules/firstvm"
    source = "./modules/secondvm"
}



