resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "291fbeff-0793-4522-a802-c64e64c4de4c"
  }
}