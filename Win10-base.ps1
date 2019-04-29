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


Enable-UAC
Enable-RemoteDesktop
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
