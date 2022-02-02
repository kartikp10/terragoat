resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "4db5aa37-9ff0-4326-ad0b-e45478815932"
  }
}