
$cred2 = Import-Clixml -Path C:\temp\my.cred
Invoke-Command -VMName LabDC -FilePath C:\DBA\HomeLab\HomeLab\PS\InstallFailoverClustering.ps1 -Credential $cred2
Invoke-Command -VMName LabVM1 -FilePath C:\DBA\HomeLab\HomeLab\PS\InstallFailoverClustering.ps1 -Credential $cred2