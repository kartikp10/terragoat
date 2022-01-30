resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "bf15bb08-936e-447d-b85b-94b422e727e4"
  }
}