# Define variables
$SysInternalsDownloadURL = "https://download.sysinternals.com/files/SysinternalsSuite.zip" # Replace with the actual URL of the installer
$SysInternalsInstallerName = "SysinteralsSuite.zip" # Replace with the actual file filename
$EverythingDownloadURL = "https://www.voidtools.com/Everything-1.4.1.1030.x86-Setup.exe"
$EverythingInstallerName = "Everything-1.4.1.1030.x86-Setup.exe"
$SysLocalTempDir = $env:TEMP
$EverythingLocalTempDir = $env:TEMP
$SysInteralsInstallerPath = Join-Path -Path $SysLocalTempDir -ChildPath $SysInternalsInstallerName
$EverythingInstallerPath = Join-Path -Path $EverythingLocalTempDir -ChildPath $EverythingInstallerName

# Download the Sysinternals installer
Write-Host "Downloading zip from $SysInternalsDownloadURL..."
try {
    Invoke-WebRequest -Uri $SysInternalsDownloadURL -OutFile $SysInteralsInstallerPath -ErrorAction Stop
    Write-Host "Installer downloaded to $SysInteralsInstallerPath"
}
catch {
    Write-Error "Failed to download installer: $($_.Exception.Message)"
    exit 1
}

# Download the Everything installer
Write-Host "Downloading zip from $EverythingDownloadURL..."
try {
    Invoke-WebRequest -Uri $EverythingDownloadURL -OutFile $EverythingInstallerPath -ErrorAction Stop
    Write-Host "Installer downloaded to $EverythingInstallerPath"
}
catch {
    Write-Error "Failed to download installer: $($_.Exception.Message)"
    exit 1
}


# Clean up (optional)
# Remove-Item -Path $InstallerPath -Force -ErrorAction SilentlyContinue