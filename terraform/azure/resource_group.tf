resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "1cc0db88-7d07-4e8f-ae36-c2a41d4592ff"
  }
}