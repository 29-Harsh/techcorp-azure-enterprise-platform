module "resource_group" {
  source  = "../../modules/resource_group"
  rgChild = var.rg
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/virtual_network"
  vnetChild  = var.vnets
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/subnet"
  snetChild  = var.snets
}

module "network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../modules/network_security_group"
  nsgChild   = var.nsgs
}