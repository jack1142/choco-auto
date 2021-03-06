﻿$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition

$silentArgs = '/S'
$key = Get-UninstallRegistryKey -SoftwareName "Sandboxie *"
if ($key) { 
  $silentArgs += ' /upgrade'
} else {
  $silentArgs += ' /install'
}

$pp = Get-PackageParameters

if ($pp.Language) {
  if ($pp.Language -match '^\d+$') {
    $pp.Language = $pp.Language -as [int32]
  }
  try {
    $lang = [System.Globalization.Cultureinfo]::GetCultureInfo($pp.Language)
  } catch {
    Write-Error "Couldn't find locale '$($pp.Language)'. Aborting..."
  }
  Write-Host "Using language: $($lang.DisplayName)"
  $silentArgs = "/lang=$($lang.LCID) $silentArgs"
}

$packageArgs = @{
  packageName            = 'sandboxie.install'
  fileType               = 'exe'
  file                   = "$toolsPath\SandboxieInstall32-v5.40.1.exe"
  file64                 = "$toolsPath\SandboxieInstall64-v5.40.1.exe"
  silentArgs             = $silentArgs
  validExitCodes         = @(0)
  softwareName           = 'Sandboxie *'
}

Install-ChocolateyInstallPackage @packageArgs
