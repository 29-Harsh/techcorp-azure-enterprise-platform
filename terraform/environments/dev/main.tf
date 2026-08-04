module "resource_group" {
  source  = "../../modules/resource_group"
  rgChild = var.rg
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/virtual_network"
  vnetChild  = var.vnets
}