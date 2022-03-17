resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "1908357e-6eaf-4d4e-a081-b6e84fe973e5"
  }
}