resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "30090017-9347-48b0-a8ad-88d22af551a8"
  }
}