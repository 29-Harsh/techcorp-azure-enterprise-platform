resource "azurerm_network_security_group" "nsghs" {
  for_each            = var.nsgChild
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}