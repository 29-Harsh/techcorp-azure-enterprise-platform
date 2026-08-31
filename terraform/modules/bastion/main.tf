data "azurerm_subnet" "snet" {
  for_each = var.bastionChild
  name = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "pip" {
  for_each = var.bastionChild
  name = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_bastion_host" "bastionhs" {
  for_each = var.bastionChild
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = data.azurerm_subnet.snet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}