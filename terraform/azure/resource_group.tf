resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "34c3fef4-00d3-4c8a-bbca-67fbf37d0a8f"
  }
}