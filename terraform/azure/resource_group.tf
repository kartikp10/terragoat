resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "5efac7af-90cd-4531-921f-3d16a250b634"
  }
}