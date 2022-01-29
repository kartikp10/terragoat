resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "4594f21a-fa80-4a24-99a7-4a193a2b8e80"
  }
}