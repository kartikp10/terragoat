resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "72b60e9f-34ba-463e-b493-309647b306f5"
  }
}