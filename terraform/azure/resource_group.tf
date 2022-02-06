resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "5e61ce40-3ba6-4162-9aad-b986c2ab9ecd"
  }
}