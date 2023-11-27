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

# resource "hyperv_vhd" "LabDC_vhd" {
#   path = "C:\\HyperV\\LabDC\\LabDC.vhdx" #Needs to be absolute path
#    source_vm = "Windows-2022-g2"  
# }

# resource "hyperv_machine_instance" "LabDC" {
#     name                   = "LabDC"
#     path                   = "C:\\HyperV\\LabDC\\"
#     generation             = 2
#     processor_count        = 2
#     dynamic_memory         = true  
#     memory_maximum_bytes   = 2147483648
#     checkpoint_type        = "disabled"
#     wait_for_state_timeout = 10
#     wait_for_ips_timeout   = 10
    
#     network_adaptors {
#         name        = "external"
#         switch_name = "external"
#     }

#   hard_disk_drives {
#     path                =  hyperv_vhd.LabDC_vhd.path
#     controller_number   = "0"
#     controller_location = "0"
#   } 

# # Configure integration services
#   integration_services = {
#     "Guest Service Interface" = true
#     "Heartbeat"               = true
#     "Key-Value Pair Exchange" = true
#     "Shutdown"                = true
#     "Time Synchronization"    = true
#     "VSS"                     = true
#   }
# }

# resource "hyperv_vhd" "LabVM1_vhd" {
#   path = "c:\\HyperV\\LabVM1\\LabVM1.vhdx" #Needs to be absolute path
#   source_vm = "Windows-2022-g2"  
# }

# resource "hyperv_machine_instance" "LabVM1" {
#     name                   = "LabVM1"
#     path                   = "c:\\HyperV\\LabVM1\\"
#     generation             = 2
#     processor_count        = 2
#     dynamic_memory         = true  
#     memory_maximum_bytes   = 2147483648
#     checkpoint_type        = "disabled"
#     wait_for_state_timeout = 10
#     wait_for_ips_timeout   = 10

#     network_adaptors {
#         name        = "internal"
#         switch_name = "internal"
#   }

#   hard_disk_drives {
#     path                =  hyperv_vhd.LabVM1_vhd.path
#     controller_number   = "0"
#     controller_location = "0"
#   }

# # Configure integration services
#   integration_services = {
#     "Guest Service Interface" = true
#     "Heartbeat"               = true
#     "Key-Value Pair Exchange" = true
#     "Shutdown"                = true
#     "Time Synchronization"    = true
#     "VSS"                     = true
#   }
# }

# resource "hyperv_vhd" "LabVM2_vhd" {
#   path = "c:\\HyperV\\LabVM2\\LabVM2.vhdx" #Needs to be absolute path
#   source_vm = "Windows-2022-g2"  
# }

# resource "hyperv_machine_instance" "LabVM2" {
#     name                   = "LabVM2"
#     path                   = "c:\\HyperV\\LabVM2\\"
#     generation             = 2
#     processor_count        = 2
#     dynamic_memory         = true  
#     memory_maximum_bytes   = 2147483648
#     checkpoint_type        = "disabled"
#     wait_for_state_timeout = 10
#     wait_for_ips_timeout   = 10

#     network_adaptors {
#         name        = "internal"
#         switch_name = "internal"
#   }

#   hard_disk_drives {
#     path                = hyperv_vhd.LabVM2_vhd.path
#     controller_number   = "0"
#     controller_location = "0"
#   }

# # Configure integration services
#   integration_services = {
#     "Guest Service Interface" = true
#     "Heartbeat"               = true
#     "Key-Value Pair Exchange" = true
#     "Shutdown"                = true
#     "Time Synchronization"    = true
#     "VSS"                     = true
#   }
# }



# resource "null_resource" "run_permission_script" {
#   triggers = {
#      script_hash = sha256("C:\\DBA\\TF\\Packer\\hv-terraform\\helpers\\CreateDomain.ps1")
#   }

#   provisioner "local-exec" {
#     command = "C:\\DBA\\TF\\Packer\\hv-terraform\\helpers\\CreateDomain.ps1"
#     interpreter = ["pwsh", "-Command"]
#   }
# }

#  data "hyperv_machine_instance" "LabDC" {
#   name = hyperv_machine_instance.LabDC.name
# }

# output "hyperv_machine_instance" {
#   value = hyperv_machine_instance.LabDC.name
# }

#Copies the file as the Administrator user using WinRM
# provisioner "file" {
#   source      = "c:/temp/name.ps1"
#   destination = "c:/SQL2022/name.ps1"
# }

# connection {
#   type     = "winrm"
#   user     = "Administrator"
#   password = ""
#   host     = "WIN-217D95R3OHE"
# }

# resource "null_resource" remoteExecProvisionerWFolder {

#   provisioner "file" {
#   source      = "c:/temp/name.ps1"
#   destination = "c:/SQL2022/name.ps1"
#   }

#   connection {
#   type     = "winrm"
#   user     = "Administrator"
#   password = ""
#   host     = "LABDC"
#   }
# }

 
/* resource "null_resource" "CreateDomain" {    
    connection {
    type = "winrm"
    host     = "${hyperv_machine_instance.LabDC.name}"
    user     = "Administrator"
    password = ""
    }

# Copies the file as the Administrator user using WinRM
  provisioner "file" {
    source      = "C:\\DBA\\TF\\Packer\\hv-terraform\\helpers\\CreateDomain.ps1"
    destination = "C:\\SQL2022\\CreateDomain.ps1"
  }  */

/*   provisioner "remote-exec" {
    script = "C:\\DBA\\TF\\Packer\\hv-terraform\\helpers\\CreateDomain.ps1"
    #script            = "./extra/scripts/windows/shared/phase-2.ps1"
  } */

/*resource "null_resource" "CreateDomain" {    
    connection {
    type = "winrm"
    host     = "${hyperv_machine_instance.LabDC.name}"
    user     = "Administrator"
    password = ""
    }

# Copies the file as the Administrator user using WinRM
  provisioner "file" {
    source      = "C:\\DBA\\TF\\Packer\\hv-terraform\\helpers\\CreateDomain.ps1"
    destination = "C:\\SQL2022\\CreateDomain.ps1"
  }  */

/*   provisioner "remote-exec" {
    script = "C:\\DBA\\TF\\Packer\\hv-terraform\\helpers\\CreateDomain.ps1"
    #script            = "./extra/scripts/windows/shared/phase-2.ps1"
  } */



# resource "null_resource" "PowerShellScriptRunAlways" {
#     triggers {
#         trigger = "${uuid()}"
#     }

#     provisioner "local-exec" {
#         command = "c:\\temp\\name.ps1"
#         interpreter = ["PowerShell", "-Command"]
#     }
# }