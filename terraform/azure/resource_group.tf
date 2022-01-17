resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "579a3686-9d98-4f41-990c-7b617ad21e15"
  }
}