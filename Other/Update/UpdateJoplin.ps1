$AppRoot        = "$PSScriptRoot\..\.."
$AppInfoIni     = "$AppRoot\App\AppInfo\appinfo.ini"
$PackageVersion = '1.0.179.0'
$DisplayVersion = '1.0.179-beta0-uroesch'
$ZipVersion     = '1.0.179'
$Archive64URL   = "https://github.com/laurent22/joplin/releases/download/v$ZipVersion/JoplinPortable.exe"
$TargetDir64    = 'Joplin.exe'
$ExtractDir64   = 'JoplinPortable.exe'
$Archive32URL   = ''
$TargetDir32    = ''
$ExtractDir32   = ''

Function Url-Basename {
  param(
    [string] $URL
  )
  $Elements = $URL.split('/')
  $Basename = $Elements[$($Elements.Length-1)]
  return $Basename
}

Function Download-Release { 
  param(
    [string] $URL
  )
  $DownloadPath = "$PSScriptRoot\$(Url-Basename -URL $URL)"
  If (!(Test-Path $DownloadPath)) {
    Invoke-WebRequest -Uri $URL -OutFile $DownloadPath
  }
  return $DownloadPath
}

Function Expand-Zip {
  param(
    [string] $ZipFile
  )
  Expand-Archive -LiteralPath $ArchiveFile -DestinationPath $PSScriptRoot -Force
}

Function Update-Release {
  param(
    [string] $URL,
    [string] $TargetDir,
    [string] $ExtractDir
  )
  $ReleaseFile = $(Download-Release -URL $URL)
  $TargetPath = "$AppRoot\App\$TargetDir"
  Switch -regex ($ReleaseFile) {
    '\.[Zz][Ii][Pp]$' { Expand-Zip --ZipFile $ReleaseFile; break }
  }
  If (Test-Path $TargetPath) {
    Write-Output "Removing $TargetPath"
    Remove-Item -Path $TargetPath -Force -Recurse
  }
  Move-Item -Path $PSScriptRoot\$ExtractDir -Destination $TargetPath -Force
  If (Test-Path $ReleaseFile) { Remove-Item $ReleaseFile }
}

Function Update-Appinfo() {
  param(
    [string] $IniFile,
	[string] $Match,
	[string] $Replace
  )
  If (Test-Path $IniFile) {
    $Content = (Get-Content $IniFile)
	$Content -replace $Match,$Replace | Out-File -FilePath $IniFile
  }
}

Update-Release -URL $Archive64URL -TargetDir $TargetDir64 -ExtractDir $ExtractDir64
Update-Appinfo -IniFile $AppInfoIni -Match '^PackageVersion\s*=.*' -Replace "PackageVersion=$PackageVersion"
Update-Appinfo -IniFile $AppInfoIni -Match '^DisplayVersion\s*=.*' -Replace "DisplayVersion=$DisplayVersion"
