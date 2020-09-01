variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "dc_name" {}
variable "datastore_name" {}
variable "pool_name" {}
variable "network_name" {}
variable "template_name" {}
variable "vm_name" {}
variable "cpu_num" {}
variable "mem_num" {}
variable "dsize" {}
variable "domname" {}
variable "ipadd" {}
variable "ipgate" {} 
variable "ipmask" {}
variable "vsphere_vm_firmware" {
     description = "Firmware set to bios or efi"
     default = "bios"
}
