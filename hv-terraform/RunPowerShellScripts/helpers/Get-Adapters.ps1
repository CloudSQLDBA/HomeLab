$cred1 = Import-Clixml  -Path C:\temp\temp.cred
Invoke-Command -VMName LabDC -ScriptBlock { Get-NetAdapter } -Credential $cred1