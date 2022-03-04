resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "ba2cf21a-9f34-41cd-9562-b90b73d1071e"
  }
}