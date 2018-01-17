# The following settings will ask you for your windows password and then
# successfuly reboot the machine everytime it needs to. After Boxstarter is
# done autologin won't be enabled.
$Boxstarter.RebootOk=$false # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$false # Save my password securely and auto-login after a reboot

# Allow running PowerShell scripts
Update-ExecutionPolicy Unrestricted

# Power Options - disable hibernation and disable monitor standby
Write-Host "Configuring power options..."
powercfg -change -monitor-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -h off

# Windows Explorer options
Set-WindowsExplorerOptions -EnableShowFileExtensions -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles

# Enable Remote Desktop
Enable-RemoteDesktop

# Disables the Bing Internet Search when searching from the search field in the Taskbar or Start Menu.
Disable-BingSearch

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
cinst git
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

# Make sure some windows update didn't creep on us after installing all
# those apps
Install-WindowsUpdate -acceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Taskbar items
Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
