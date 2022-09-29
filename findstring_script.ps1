#Name: Per Stoor
#Created: 2021-04-08
#Type of script: 
#Script to see if a newly setup Windows 10 machine has been installed properly.
#Not useful since new machines need admin access to first initiate scripts in PowerShell.

#Preparing variables for the notepad file and file path plus inserting the Select-String output into a variable
$findString = "C:\Temp\findstring.txt"
$successfulDeploymentStringYes = Select-String -Path "C:\Windows\CCM\Logs\smsts.log" -Pattern "Successful Deployment"
$trueFalse = Select-String -Path "C:\Windows\CCM\Logs\smsts.log" -Pattern "Successful Deployment" -Quiet
$successfulDeploymentStringNo = "'Successful Deployment' cannot be found. Try again or re-image Windows 10."

#If-Else statement to check if the string "Successful Deployment exists or not"
#If it exists it creates a notepad file with the string displayed on the top row. Also immediately deletes the created notepad .txt file
#If it does not exist it creates a notepad file with the string "try again or re-image Windows 10".
if ($trueFalse){

[Void](New-Item -Path "$findString" -ItemType File)
Add-Content -Path "$findString" -Value "$successfulDeploymentStringYes"
Start-Process Notepad $findString
Start-Sleep -Seconds 1
Remove-Item -Path $findString

}
else {

[Void](New-Item -Path "$findString" -ItemType File)
Add-Content "$findString" "$successfulDeploymentStringNo"
Start-Process Notepad $findString
Start-Sleep -Seconds 1
Remove-Item -Path $findString

}
