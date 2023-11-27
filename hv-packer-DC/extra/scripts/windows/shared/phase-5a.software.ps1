# Post updates entries, not required to do a reboot
Write-Output "Phase 5a [START] - Software"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#install Firefox
choco install firefox -y --ia="/ALLUSERS /S" --no-progress --limit-output

#install Google Chrome
choco install googlechrome -y

#install SSMS
choco install sql-server-management-studio -y -force

Install-Module DBATools -Force

Install-Module AWSPowerShell -Force

New-Item c:\temp -Type Directory