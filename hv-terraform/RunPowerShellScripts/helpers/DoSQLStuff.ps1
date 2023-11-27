$cred2 = Import-Clixml -Path C:\temp\my.cred
Invoke-Command -VMName labVM1 -FilePath C:\DBA\HomeLab\PS\DoSQLStuff.ps1 -Credential $cred2
Invoke-Command -VMName labVM2 -FilePath C:\DBA\HomeLab\PS\DoSQLStuff.ps1 -Credential $cred2