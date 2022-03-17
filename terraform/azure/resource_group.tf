resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "549bf2a7-f077-46a3-b481-8955f38fc069"
  }
}