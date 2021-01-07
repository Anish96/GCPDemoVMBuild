module "firstvm" {
    #source = "./modules/firstvm"
    source = "./modules/network"
    source = "./modules/secondvm"
}
