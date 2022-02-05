resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "aefc25a5-1ad1-4ca5-8201-23d69bf12f8f"
  }
}