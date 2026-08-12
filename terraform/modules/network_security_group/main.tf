data "azurerm_subnet" "snet" {
  for_each = var.nsgChild
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

resource "azurerm_network_security_group" "nsghs" {
  for_each            = var.nsgChild
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}

resource "azurerm_subnet_network_security_group_association" "snetnsgassociaton" {
  for_each                  = var.nsgChild
  network_security_group_id = azurerm_network_security_group.nsghs[each.key].id
  subnet_id                 = data.azurerm_subnet.snet[each.key].id
}