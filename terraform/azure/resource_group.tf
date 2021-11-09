resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "8b76e81d-962d-4d6b-82e3-f211f9cf6679"
  }
}