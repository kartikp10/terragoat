resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "0e03c213-41c8-4f0e-be84-90cdd089f119"
  }
}