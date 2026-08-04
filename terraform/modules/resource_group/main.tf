resource "azurerm_resource_group" "rghs" {
    for_each = var.rgChild
    name = each.key
    location = each.value
}