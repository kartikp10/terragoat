resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "a32feb93-d895-47f7-bd7e-80cfaffe1690"
  }
}