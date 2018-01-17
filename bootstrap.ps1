param (
  [string]$PackageName = ".\win10-zBase.ps1"
)

# Bootstrap Boxstarter, will install requirements too if missing
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('http://boxstarter.org/bootstrapper.ps1'))
Get-Boxstarter -Force

# Enable PSRemoting to allow remote management
Enable-PSRemoting -Force

# Passing packages to install from commandline
Install-BoxstarterPackage -PackageName $PackageName -DisableReboots

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('http://boxstarter.org/bootstrapper.ps1'))
