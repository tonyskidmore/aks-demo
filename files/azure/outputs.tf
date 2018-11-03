output "hostname" {
  value = "${var.hostname}"
}

output "ip_address" {
  value = "${azurerm_public_ip.lbpip.ip_address}"
}