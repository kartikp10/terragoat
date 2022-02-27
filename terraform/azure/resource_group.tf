resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "1402719a-6990-4800-9772-4c3cd6e586d8"
  }
}