terraform {
  required_providers {
    hyperv = {
      version = "1.0.4"
      source  = "registry.terraform.io/taliesins/hyperv"
    }
  }
}

provider "hyperv" {
	user     = "Amy"
	password = ""
}

resource "hyperv_vhd" "LabDC_vhd" {
  path = "C:\\HyperV\\LabDC\\LabDC.vhdx" #Needs to be absolute path
   source_vm = "Windows-2022-DC2-g2"  
}

resource "hyperv_machine_instance" "LabDC" {
    name                   = "LabDC"
    path                   = "C:\\HyperV\\LabDC\\"
    generation             = 2
    processor_count        = 2
    dynamic_memory         = true  
    memory_maximum_bytes   = 2147483648
    checkpoint_type        = "disabled"
    
    network_adaptors {
        name        = "external"
        switch_name = "external"
    }

  hard_disk_drives {
    path                =  hyperv_vhd.LabDC_vhd.path
    controller_number   = "0"
    controller_location = "0"
  } 

# Configure integration services
  integration_services = {
    "Guest Service Interface" = true
    "Heartbeat"               = true
    "Key-Value Pair Exchange" = true
    "Shutdown"                = true
    "Time Synchronization"    = true
    "VSS"                     = true
  }
}
