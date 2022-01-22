resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "2a32121e-16e9-43c2-b660-0a45ce1b9582"
  }
}