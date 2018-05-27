# --------------------------------------
# BoxStarter script to setup Win10 base
# Author: Zac Rollins
# --------------------------------------
Disable-UAC

# Windows Explorer options
Set-WindowsExplorerOptions -EnableShowFileExtensions

Disable-BingSearch
Disable-GameBarTips

# Web Browsers
# cinst -y googlechrome
# cinst -y firefox

# Install Windows Update and reboot
Install-WindowsUpdate -acceptEula

# Tweaks
# download Invoke-Win10Clean.ps1 and run
$outPath = 'C:\Utils\'
$outFile = 'Invoke-Win10Clean.ps1'
$dlFile = Join-Path -Path $outPath -ChildPath $outFile
if (-not(test-path $outPath)) {
    New-Item -Path $outPath -ItemType Directory
}
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/zacrollins/WinSetup/master/Invoke-Win10Clean.ps1' -UseBasicParsing -OutFile $dlFile
Write-Verbose -Verbose -Message "Downloaded Invoke-Win10Clean.ps1 to c:\Utils. Inspect and run manually"

Enable-UAC
Enable-RemoteDesktop
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
