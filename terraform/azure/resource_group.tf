resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "b941ff4f-5ff3-46eb-ae8f-dc36a58d35f2"
  }
}