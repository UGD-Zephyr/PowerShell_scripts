# Programmer: Per Stoor
# Date: 2021-08-24
# Last Changed: 2021-08-24
# Type of Script: Turning off all windowed applications and shutdown the computer

# NOTICE!
# This Script can't close Task Manager or File Explorer windows.
# Administrator privileges are needed to close Task Manager and explorer is
# tied to so many things I'm just leaving it alone for now.

# Defining the "Yes" variables.
$yes1 = "YES"
$yes2 = "Yes"
$yes3 = "yes"
$yes4 = "y"
$yes5 = "Y"

# Defining the "No" variables.
$no1 = "NO"
$no2 = "No"
$no3 = "no"
$no4 = "n"
$no5 = "N"

# Beginning of Script output.
Clear-Host
Write-Output "Script starting."
Write-Output "This Script will not close open File Explorer windows OR Windows Terminal."
$closeAppsChoice = Read-Host -Prompt "Would you like to close all open Apps? (Y/N)"

# Stopping all open apps (minus some stuff running in the background) except the Windows Terminal so a last shutdown choice can still occur.
if ($closeAppsChoice.Equals($yes1) -or $closeAppsChoice.Equals($yes2) -or $closeAppsChoice.Equals($yes3) -or $closeAppsChoice.Equals($yes4) -or $closeAppsChoice.Equals($yes5)){

  Write-Output "Closing open applications..."
  $activeApps = (Get-Process | Where-Object {$_.MainWindowTitle -and ($_.ProcessName -ne "ApplicationFrameHost") -and ($_.ProcessName -ne "pwsh") -and ($_.ProcessName -ne "SystemSettings") -and ($_.ProcessName -ne "Taskmgr")}).Id

  
    if ($null -eq $activeApps){

      Write-Output "Currently there are no closable open apps..."

    }
    else{
      
      $activeApps | ForEach-Object (Stop-Process -Id $activeApps)
    
    }
}
elseif ($closeAppsChoice.Equals($no1) -or $closeAppsChoice.Equals($no2) -or $closeAppsChoice.Equals($no3) -or $closeAppsChoice.Equals($no4) -or $closeAppsChoice.Equals($no5)) {
  
  Write-Output "All open Apps will remain open."

}
else{

  Write-Output "Incorrect input...try again."

}
# Asking if the Computer should be shutdown.
$shutdownChoice = Read-host -Prompt "Would you like to shutdown the Computer? (Y/N)"

 if ($shutdownChoice.Equals($yes1) -or $shutdownChoice.Equals($yes2) -or $shutdownChoice.Equals($yes3) -or $shutdownChoice.Equals($yes4) -or$shutdownChoice.Equals($yes5)){

   Write-Output "Shutting down Computer..."
   Stop-Computer

 }
 elseif ($shutdownChoice.Equals($no1) -or $shutdownChoice.Equals($no2) -or $shutdownChoice.Equals($no3) -or $shutdownChoice.Equals($no4) -or$shutdownChoice.Equals($no5)){
   
  Write-Output "Please Shutdown the Computer manually when finished.`nScript closing..."
 
}
else{

  Write-Output "Incorrect input...try again."

} 
# End of Script.
