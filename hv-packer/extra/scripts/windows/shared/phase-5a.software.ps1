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

New-Item c:\SQL2022\UPDATES -Type Directory
Save-DbaKbUpdate -Name KB5030731 -Path "c:\SQL2022\UPDATES"

# Your account access key - must have read access to your S3 Bucket
$accessKey = ""
# Your account secret access key
$secretKey = ""
# The region associated with your bucket e.g. eu-west-1, us-east-1 etc. (see http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-regions)
$region = "us-east-1"
# The name of your S3 Bucket
$bucket = "installfiles4packer"
# The folder in your bucket to copy, including trailing slash. Leave blank to copy the entire bucket
$keyPrefix = "SQL2022/"
# The local file path where files should be copied
$localPath = "C:\SQL2022\INSTALL"    

$objects = Get-S3Object -BucketName $bucket -KeyPrefix $keyPrefix -AccessKey $accessKey -SecretKey $secretKey -Region $region

foreach($object in $objects) {
    $localFileName = $object.Key -replace $keyPrefix, ''
    if ($localFileName -ne '') {
        $localFilePath = Join-Path $localPath $localFileName
        Copy-S3Object -BucketName $bucket -Key $object.Key -LocalFile $localFilePath -AccessKey $accessKey -SecretKey $secretKey -Region $region
    }
}

Write-Output "Phase 5a [END]- Software"
