resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "6c5bd7e7-ee61-4188-a139-fecd5a6b6316"
  }
}