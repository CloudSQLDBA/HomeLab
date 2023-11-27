$cred1 = Import-Clixml  -Path C:\temp\temp.cred
Invoke-Command -VMName labDC -FilePath C:\DBA\HomeLab\PS\CreateDomain.ps1 -Credential $cred1