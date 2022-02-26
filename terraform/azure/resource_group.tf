resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "4a287619-2547-4e7b-8156-45d531b6d7e9"
  }
}