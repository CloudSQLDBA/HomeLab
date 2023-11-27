# Post updates entries, not required to do a reboot
Write-Output "Phase 5b [START] - Software"

New-Item c:\SQL2022\SQLDATA -Type Directory
New-Item c:\SQL2022\SQLLOGS -Type Directory
New-Item c:\SQL2022\TEMPDB -Type Directory
New-Item c:\SQL2022\SQLBACKUPS -Type Directory
New-Item c:\SQL2022\INSTALL -Type Directory

#Install SQL Server 2022

Install-DbaInstance -Version 2022 -AuthenticationMode Mixed -path 'c:\SQL2022\INSTALL' -DataPath 'c:\SQL2022\SQLDATA' `
-LogPath 'c:\SQL2022\SQLLOGS' -TempPath 'c:\SQL2022\TEMPDB' -BackupPath 'c:\SQL2022\SQLBACKUPS' -PerformVolumeMaintenanceTasks `
-SaveConfiguration 'c:\SQL2022\SQLCONFIG' -UpdateSourcePath 'c:\SQL2022\UPDATES' -Confirm:$false

Write-Output "Phase 5b [END]- Software"
