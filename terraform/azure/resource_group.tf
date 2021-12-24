resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "715d43b4-e38b-49c3-a706-568dac078251"
  }
}