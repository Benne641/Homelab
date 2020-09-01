provider "vsphere" {
    vsphere_server = "${var.vsphere_server}"
    user = "${var.vsphere_user}"
    password = "${var.vsphere_password}"
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.dc_name}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.pool_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.network_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.template_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

#Zabbix_Test
resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = "${var.cpu_num}"
  memory   = "${var.mem_num}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"
  firmware  = "${var.vsphere_vm_firmware}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${var.dsize}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.vm_name}"
        domain = "${var.domname}"
      }

      network_interface {
        ipv4_address = "${var.ipadd}"
        ipv4_netmask = "${var.ipmask}"
      }
      ipv4_gateway = "${var.ipgate}"
    }
  }
}
