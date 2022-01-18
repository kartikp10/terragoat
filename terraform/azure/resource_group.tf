resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "6ebafaea-8e6a-490c-9238-219f2eee9c33"
  }
}