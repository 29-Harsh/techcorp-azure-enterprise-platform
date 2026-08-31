data "azurerm_subnet" "snet" {
  for_each = var.nicChild
  name = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

resource "azurerm_network_interface" "nic" {
  for_each = var.nicChild
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.snet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}