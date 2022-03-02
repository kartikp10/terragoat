resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "3cbcd0d8-055c-4b85-af4b-08d36a9ec19e"
  }
}