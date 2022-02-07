resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "b1fb5578-588f-4234-aa5d-4be65181b494"
  }
}