resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "37b72744-e85d-487d-b562-ff3784eabd32"
  }
}