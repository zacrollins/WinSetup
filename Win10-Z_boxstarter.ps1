# --------------------------------------
# BoxStarter script to setup workstation
# Author: Zac Rollins
# --------------------------------------

Disable-UAC

# Windows Explorer settings
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

Enable-PSRemoting
Disable-BingSearch
Disable-GameBarTips

# File Explorer Settings
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 0
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 0
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

# Web Browsers
cinst -y googlechrome
cinst -y firefox

# NuGet
Install-PackageProvider -Name "nuget" -Force
cinst -y NuGet.CommandLine

# DotNetAndPowershell
cinst -y PowerShell
cinst -y powershell-core
cinst -y DotNet4.7

# HyperV and WSL
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install -y Microsoft-Windows-Subsystem-Linux -source windowsfeatures
# Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu.appx

# Ops software & tools
cinst -y sql-server-management-studio
cinst -y rsat
cinst -y git -params="'/WindowsTerminal /NoShellIntegration /SChannel'"
cinst -y git-credential-manager-for-windows
cinst -y nmap
cinst -y wireshark
cinst -y winscp
cinst -y conemu
cinst -y 7zip.commandline
cinst -y 7zip
cinst -y rdcman
cinst -y keepass
cinst -y keepass-rpc
cinst -y vscode
cinst -y firacode
cinst -y postman
cinst -y OpenSSL.Light
cinst -y dotnetcore-sdk
cinst -y hyper


Enable-UAC
Enable-RemoteDesktop
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula