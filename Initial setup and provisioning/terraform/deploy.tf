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

data "vsphere_virtual_machine" "template2" {
  name          = "${var.template_name2}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

#Crossbone
resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  #num_cpus = 2
  #memory   = 4096
  num_cpus = "${var.cpu_num}"
  memory   = "${var.mem_num}"
  guest_id = "${data.vsphere_virtual_machine.template2.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template2.scsi_type}"
  firmware  = "${var.vsphere_vm_firmware}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    #size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    size             = "${var.dsize}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template2.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template2.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template2.id}"

    customize {
      linux_options {
        #host_name = "terraform-test"
        #domain    = "localhost"
        host_name = "${var.vm_name}"
        domain = "${var.domname}"
      }

      network_interface {
        #ipv4_address = "10.0.0.101"
        #ipv4_netmask = 24
        ipv4_address = "${var.ipadd}"
        ipv4_netmask = "${var.ipmask}"
        
      }
      #ipv4_gateway = "10.0.0.1"
      ipv4_gateway = "${var.ipgate}"
    }
  }
}

#SDF-1
resource "vsphere_virtual_machine" "vm2" {
  name             = "${var.vm_name2}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  #num_cpus = 2
  #memory   = 4096
  num_cpus = "${var.cpu_num2}"
  memory   = "${var.mem_num2}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"
  firmware  = "${var.vsphere_vm_firmware}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    #size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    size             = "${var.dsize2}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        #host_name = "terraform-test"
        #domain    = "localhost"
        host_name = "${var.vm_name2}"
        domain = "${var.domname}"
      }

      network_interface {
        #ipv4_address = "10.0.0.101"
        #ipv4_netmask = 24
        ipv4_address = "${var.ipadd2}"
        ipv4_netmask = "${var.ipmask}"
        
      }
      #ipv4_gateway = "10.0.0.1"
      ipv4_gateway = "${var.ipgate}"
    }
  }
}

#Webserver
resource "vsphere_virtual_machine" "vm3" {
  name             = "${var.vm_name3}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  #num_cpus = 2
  #memory   = 4096
  num_cpus = "${var.cpu_num3}"
  memory   = "${var.mem_num3}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"
  firmware  = "${var.vsphere_vm_firmware}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    #size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    size             = "${var.dsize3}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        #host_name = "terraform-test"
        #domain    = "localhost"
        host_name = "${var.vm_name3}"
        domain = "${var.domname}"
      }

      network_interface {
        #ipv4_address = "10.0.0.101"
        #ipv4_netmask = 24
        ipv4_address = "${var.ipadd3}"
        ipv4_netmask = "${var.ipmask}"
        
      }
      #ipv4_gateway = "10.0.0.1"
      ipv4_gateway = "${var.ipgate}"
    }
  }
}

#WordPress
resource "vsphere_virtual_machine" "vm4" {
  name             = "${var.vm_name4}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  #num_cpus = 2
  #memory   = 4096
  num_cpus = "${var.cpu_num4}"
  memory   = "${var.mem_num4}"
  guest_id = "${data.vsphere_virtual_machine.template2.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template2.scsi_type}"
  firmware  = "${var.vsphere_vm_firmware2}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template2.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    #size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    size             = "${var.dsize4}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template2.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template2.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template2.id}"

    customize {
      linux_options {
        #host_name = "terraform-test"
        #domain    = "localhost"
        host_name = "${var.vm_name4}"
        domain = "${var.domname}"
      }

      network_interface {
        #ipv4_address = "10.0.0.101"
        #ipv4_netmask = 24
        ipv4_address = "${var.ipadd4}"
        ipv4_netmask = "${var.ipmask}"
        
      }
      #ipv4_gateway = "10.0.0.1"
      ipv4_gateway = "${var.ipgate}"
    }
  }
}

#Zoinks
resource "vsphere_virtual_machine" "vm5" {
  name             = "${var.vm_name5}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  #num_cpus = 2
  #memory   = 4096
  num_cpus = "${var.cpu_num5}"
  memory   = "${var.mem_num5}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"
  firmware  = "${var.vsphere_vm_firmware}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    #size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    size             = "${var.dsize5}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        #host_name = "terraform-test"
        #domain    = "localhost"
        host_name = "${var.vm_name5}"
        domain = "${var.domname}"
      }

      network_interface {
        #ipv4_address = "10.0.0.101"
        #ipv4_netmask = 24
        ipv4_address = "${var.ipadd5}"
        ipv4_netmask = "${var.ipmask}"
        
      }
      #ipv4_gateway = "10.0.0.1"
      ipv4_gateway = "${var.ipgate}"
    }
  }
}
