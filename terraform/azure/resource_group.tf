resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "d06c2838-3a18-462c-9d3b-d51ca3ca4b09"
  }
}