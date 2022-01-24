resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "e3b49e1d-8208-4a66-a916-2147a4589d1a"
  }
}