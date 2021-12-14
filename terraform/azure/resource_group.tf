resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "d82c6044-2ee6-4a77-886c-217f42b87158"
  }
}