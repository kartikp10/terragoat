resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "e5619053-2ca9-41aa-88c7-ff9a8a0e81bb"
  }
}