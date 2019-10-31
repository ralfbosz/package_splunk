$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.splunk.com/products/splunk/releases/7.3.2/windows/splunk-7.3.2-c60db69f8e32-x86-release.msi'
$url64      = 'https://download.splunk.com/products/splunk/releases/7.3.2/windows/splunk-7.3.2-c60db69f8e32-x64-release.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Splunk Enterprise'

  checksum      = 'cbf2049fd935aa9232427dc9032e2248a62064289a6fa75d425a5227b4ad0ecc'
  checksumType  = 'sha256'
  checksum64    = 'cbf2049fd935aa9232427dc9032e2248a62064289a6fa75d425a5227b4ad0ecc'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AGREETOLICENSE=YES"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
