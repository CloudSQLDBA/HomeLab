$cred1 = Import-Clixml  -Path C:\temp\temp.cred
Invoke-Command -VMName labDC -FilePath C:\DBA\HomeLab\HomeLab\PS\SetIPs.ps1 -Credential $cred1
Invoke-Command -VMName labVM1 -FilePath C:\DBA\HomeLab\HomeLab\PS\SetIPs.ps1 -Credential $cred1
Invoke-Command -VMName labVM2 -FilePath C:\DBA\HomeLab\HomeLab\PS\SetIPs.ps1 -Credential $cred1