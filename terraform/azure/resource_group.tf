resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "cb0450f5-68db-4ce7-bcec-9a34aafbb345"
  }
}