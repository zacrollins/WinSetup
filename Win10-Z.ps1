# Allow running PowerShell scripts
Update-ExecutionPolicy RemoteSigned

# Power Options - disable hibernation and disable monitor standby
Write-Host "Configuring power options..."
powercfg -change -monitor-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -h off

# Enable Remote Desktop
Enable-RemoteDesktop

Enable-PSRemoting

# Disables the Bing Internet Search when searching from the search field in the Taskbar or Start Menu.
Disable-BingSearch

# Disable GameBar tips
Disable-GameBarTips

# Enable Microsoft update
Enable-MicrosoftUpdate

# Web Browsers
cinst googlechrome

# NuGet
Install-PackageProvider -Name "nuget" -Force
cinst NuGet.CommandLine

# Install Windows Update and reboot
Install-WindowsUpdate -acceptEula
if (Test-PendingReboot) { Invoke-Reboot }

#region DotNetAndPowershell
cinst PowerShell
cinst powershell-core
cinst DotNet4.7
#endregion

#region Runtimes
cinst flashplayerplugin
cinst jre8
cinst vcredist-all
#endregion

# Ops software & tools
cinst sql-server-management-studio
cinst rsat
cinst git --params="'/WindowsTerminal /NoShellIntegration'"
cinst git-credential-manager-for-windows
cinst nmap
cinst wireshark
cinst winscp
cinst conemu
cinst 7zip.commandline
cinst 7zip
cinst rdm
cinst lastpass
cinst visualStudioCode
cinst postman
cinst OpenSSL.Light
cinst dotnetcore-sdk
cinst hyper
cinst nodejs
cinst pstools

# Tweaks
# download Invoke-Win10Clean.ps1 and run
$outPath = 'C:\Utils\'
$outFile = 'Invoke-Win10Clean.ps1'
$dlFile = Join-Path -Path $outPath -ChildPath $outFile
if (-not(test-path $outPath)) {
    New-Item -Path $outPath -ItemType Directory
}
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/zacrollins/WinSetup/master/Invoke-Win10Clean.ps1' -UseBasicParsing -OutFile $dlFile
Invoke-Expression $dlFile

# Make sure some windows update didn't creep on us after installing all
# those apps
Install-WindowsUpdate -acceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Taskbar items
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
