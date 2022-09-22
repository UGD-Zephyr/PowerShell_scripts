# Programmer: Per Stoor
# Date: 2022-07-15
# Last changed: 2022-07-15
# Type of script: Trying to automate Software center downloads.

Function Trigger-AppInstallation
{
 
Param
(
 [String][Parameter(Mandatory=$True, Position=1)] $AppName,
 [ValidateSet("Install","Uninstall")]
 [String][Parameter(Mandatory=$True, Position=2)] $Method
)
 
Begin {
$Application = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" | Where-Object {$_.Name -like $AppName})
 
$Args = @{EnforcePreference = [UINT32] 0
Id = "$($Application.id)"
IsMachineTarget = $Application.IsMachineTarget
IsRebootIfNeeded = $False
Priority = 'High'
Revision = "$($Application.Revision)" }
 
}
 
Process
 
{
 
Invoke-CimMethod -Namespace "root\ccm\clientSDK" -ClassName CCM_Application -MethodName $Method -Arguments $Args
 
}
 
End {}
 
}
