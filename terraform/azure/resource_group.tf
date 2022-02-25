resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "9692ec70-a2b8-4cb6-8812-6d1d398e369e"
  }
}