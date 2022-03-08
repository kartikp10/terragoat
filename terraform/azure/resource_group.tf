resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "3f152679-2092-4bef-a5f4-512180155d62"
  }
}