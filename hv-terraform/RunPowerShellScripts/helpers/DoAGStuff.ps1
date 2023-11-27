$cred2 = Import-Clixml -Path C:\temp\my.cred
Invoke-Command -VMName labVM1 -FilePath C:\DBA\HomeLab\PS\DoAGStuff.ps1 -Credential $cred2