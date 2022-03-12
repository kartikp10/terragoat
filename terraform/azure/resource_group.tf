resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "2c5898a4-bd55-434d-b1c7-f9a227ec319e"
  }
}