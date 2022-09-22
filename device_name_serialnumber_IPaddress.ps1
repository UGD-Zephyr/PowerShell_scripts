# Programmer: Per Stoor
# Date: 2022-05-24
# Last changed: 2022-05-24
# Type of script: Script to display device information

$serialNumber 	= (Get-CIMInstance win32_bios).SerialNumber #| format-list SerialNumber
$hostName 	= [System.Net.Dns]::GetHostName()
$ipAddress 	= Get-NetIPAddress -AddressFamily IPv4 -InterfaceIndex $(Get-NetConnectionProfile | Select-Object -ExpandProperty InterfaceIndex) | Select-Object -ExpandProperty IPAddress

Write-Output "Serial Number:	$serialNumber"
Write-Output "Host name:	$hostName"
Write-Output "IP Address:	$ipAddress"

# END OF SCRIPT
