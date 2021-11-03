resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "a2810d1b-b32f-4cee-a501-bc1c30c56a89"
  }
}