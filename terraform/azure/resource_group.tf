resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "7e5c0510-9142-4089-b8b0-6cf8079ef3f0"
  }
}