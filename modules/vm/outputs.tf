output "vmss_id" {
  description = "ID of the VM scale set"
  value       = azurerm_virtual_machine_scale_set.vmss.id
}
