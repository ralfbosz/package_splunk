$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.splunk.com/products/splunk/releases/7.1.3/windows/splunk-7.1.3-51d9cac7b837-x86-release.msi'
$url64      = 'https://download.splunk.com/products/splunk/releases/7.1.3/windows/splunk-7.1.3-51d9cac7b837-x64-release.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Splunk Enterprise'

  checksum      = '7d0704f7518fc8f787239461f3c97ab5776f0dcff660d08a6dc830814b2620fb'
  checksumType  = 'sha256'
  checksum64    = '7309941b59c2b6996b5ff2c58b3e0fbec2604f034baf1466a3c7369ea474f21e'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AGREETOLICENSE=YES"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
