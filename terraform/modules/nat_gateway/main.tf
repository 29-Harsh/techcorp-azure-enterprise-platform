resource "azurerm_nat_gateway" "natgw" {
  for_each            = var.natGwChild
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}