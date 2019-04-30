# --------------------------------------
# Workstation setup script for zac
# Author: Zac Rollins
# --------------------------------------

# # File Explorer Settings
# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 0
# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 0
# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Web Browsers
cinst -y googlechrome

# NuGet
Install-PackageProvider -Name "nuget" -Force
cinst -y NuGet.CommandLine

# DotNetAndPowershell
cinst -y PowerShell
cinst -y powershell-core
cinst -y DotNet4.7

# Ops software & tools
cinst -y sql-server-management-studio
cinst -y azure-data-studio
cinst -y rsat
cinst -y git -params="'/WindowsTerminal /NoShellIntegration'"
cinst -y git-credential-manager-for-windows
cinst -y 7zip.commandline
cinst -y 7zip
cinst -y rdcman
cinst -y colortool
cinst -y keypirinha
cinst -y vscode
cinst -y firacode
cinst -y hackfont
cinst -y postman
cinst -y OpenSSL.Light
cinst -y dotnetcore-sdk
cinst -y bitwarden
cinst -y bitwarden-cli
cinst -y authy-desktop
cinst -y microsoftazurestorageexplorer
cinst -y microsoft-teams
cinst -y slack

# cinst -y nmap
# cinst -y wireshark

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
)
foreach ($module in $modules) {
    Write-Verbose -Message "Installing [$module]..." -Verbose
    Install-Module -Name $module
}
