resource "null_resource" "RenameVM" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\RenameVM.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

resource "null_resource" "AddAdapters" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\AddAdapters.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

resource "null_resource" "RenameAdapters" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\RenameAdapters.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

resource "null_resource" "SetIPs" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\SetIPs.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

resource "null_resource" "CreateDomain" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\CreateDomain.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
} 

resource "null_resource" "AddComputers2Domain" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\AddComputers2Domain.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

 resource "null_resource" "InstallFailoverClustering" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\InstallFailoverClustering.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

 resource "null_resource" "DoSQLStuff" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\DoSQLStuff.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

 resource "null_resource" "DoADStuff" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\DoADStuff.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

 resource "null_resource" "DoSQLStuff2" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\DoSQLStuff2.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

 resource "null_resource" "DoStuff" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\DoStuff.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}

 resource "null_resource" "DoAGStuff" {
    provisioner "local-exec" {
        command = ".'${path.module}\\helpers\\DoAGStuff.ps1'"
        interpreter = ["PowerShell", "-Command"]
    }
}