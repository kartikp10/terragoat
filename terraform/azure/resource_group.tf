resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "1614600c-8ed4-4a97-8956-97b9ea70b204"
  }
}