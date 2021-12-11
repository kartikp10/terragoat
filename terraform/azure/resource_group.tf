resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "433738b8-d610-4567-a8f7-60d94f8299d0"
  }
}