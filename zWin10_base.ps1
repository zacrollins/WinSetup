# --------------------------------------
# Author: Zac Rollins
# --------------------------------------

# Web Browsers
cinst -y googlechrome
cinst -y opera

# NuGet
Install-PackageProvider -Name "nuget" -Force
cinst -y NuGet.CommandLine

# DotNetAndPowershell
cinst -y PowerShell
cinst -y powershell-core
cinst -y netfx-4.7.2-devpack
cinst -y dotnetcore-sdk

# HyperV and WSL
# choco install -y Microsoft-Hyper-V-All -source windowsFeatures
# choco install -y Microsoft-Windows-Subsystem-Linux -source windowsfeatures
# Ubuntu
# Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile ~/Ubuntu.appx -UseBasicParsing
# Add-AppxPackage -Path ~/Ubuntu.appx

# Ops software & tools
cinst -y sql-server-management-studio
cinst -y rsat
cinst -y git -params="'/WindowsTerminal /NoShellIntegration'"
cinst -y git-credential-manager-for-windows
cinst -y nmap
cinst -y wireshark
cinst -y winscp
cinst -y conemu
cinst -y 7zip.commandline
cinst -y 7zip
cinst -y rdcman
cinst -y vscode
cinst -y firacode
cinst -y postman
cinst -y OpenSSL.Light
# cinst -y hyper
