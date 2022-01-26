resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "e6e30710-a5bd-4ce6-91f4-539f4fe28b51"
  }
}