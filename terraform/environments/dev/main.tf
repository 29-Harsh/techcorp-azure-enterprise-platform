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
  depends_on = [module.subnet]
  source     = "../../modules/network_security_group"
  nsgChild   = var.nsgs
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/public_ip"
  pipChild   = var.pip
}

module "bastion" {
  depends_on   = [module.public_ip, module.subnet]
  source       = "../../modules/bastion"
  bastionChild = var.bastion
}

module "network_interface_card" {
  depends_on = [module.subnet]
  source     = "../../modules/network_interface_card"
  nicChild   = var.nic
}

# module "virtual_machine" {
#   depends_on = [module.subnet, module.network_interface_card]
#   source     = "../../modules/virtual_machine"
#   vmChild    = var.vmlinux
# }

