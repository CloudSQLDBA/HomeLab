#Export and Import Creds	
$cred1 = get-credential
$cred1 | Export-Clixml -Path C:\temp\my.cred
$cred1 = Import-Clixml -Path C:\temp\my.cred

Invoke-Command -VMName labVM1 -ScriptBlock { Add-Computer -DomainName MsSQLServerDBA.com -Restart -Credential $Using:cred1 }
Invoke-Command -VMName labVM2 -ScriptBlock { Add-Computer -DomainName MsSQLServerDBA.com -Restart -Credential $Using:cred1 }