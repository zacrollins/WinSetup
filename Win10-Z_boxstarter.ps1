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

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

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
cinst -y dotnetfx
cinst -y dotnetcore-sdk

# HyperV and WSL
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install -y Microsoft-Windows-Subsystem-Linux -source windowsfeatures
# Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu.appx

# Ops software & tools
cinst -y 7zip.commandline
cinst -y 7zip
cinst -y altdrag
cinst -y authy-desktop
cinst -y azure-data-studio
cinst -y firacode
cinst -y git -params="'/WindowsTerminal /NoShellIntegration'"
cinst -y git-credential-manager-for-windows
cinst -y hackfont
cinst -y keypirinha
cinst -y microsoftazurestorageexplorer
cinst -y nmap
cinst -y nuget.commandline
cinst -y OpenSSL.Light
cinst -y postman
cinst -y rdcman
cinst -y sql-server-management-studio
cinst -y vscode

# cinst -y wireshark

# Install all RSAT tools
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online

# powershell modules
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
$modules = @(
    'Az'
    'Az.Security'
    'AzureAD'
    'SqlServer'
    'Lability'
    'InvokeBuild'
    'importexcel'
    'PSWindowsUpdate'
    'posh-git'
    # 'PoshNmap'
)
foreach ($module in $modules) {
    Write-Verbose -Message "Installing [$module]..." -Verbose
    Install-Module -Name $module
}

Enable-UAC
Enable-RemoteDesktop
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula