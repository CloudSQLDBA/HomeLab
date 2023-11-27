
$cred1 = Import-Clixml  -Path C:\temp\temp.cred
Invoke-Command -VMName LabDC -FilePath C:\DBA\HomeLab\HomeLab\PS\SetSwitch.ps1 -Credential $cred1