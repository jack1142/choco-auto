﻿$ErrorActionPreference = 'Stop'
 
$packageArgs = @{
  packageName            = 'audacity-ffmpeg'
  fileType               = 'exe'
  url                    = 'https://lame.buanzo.org/ffmpeg-win-2.2.2.exe'
  checksum               = 'abf3eee0c2556f6efa0d4446df7244778a61d6c3c339a4ecabaccdd85568e4e8'
  checksumType           = 'sha256'
  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes         = @(0)
  softwareName           = 'FFmpeg for Audacity *'
}
Install-ChocolateyPackage @packageArgs