$cred1 = Import-Clixml  -Path C:\temp\temp.cred
Invoke-Command -VMName LabDC -FilePath C:\DBA\HomeLab\HomeLab\PS\RenameVM.ps1 -Credential $cred1
Invoke-Command -VMName LabVM1 -FilePath C:\DBA\HomeLab\HomeLab\PS\RenameVM.ps1 -Credential $cred1
Invoke-Command -VMName LabVM2 -FilePath C:\DBA\HomeLab\HomeLab\PS\RenameVM.ps1 -Credential $cred1