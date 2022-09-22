# Name: Per Stoor
# Created: 2021-04-07
# Updated: 2022-09-22

#This sets the file paths being used to variables and prepares the shell for the popup box before starting the script.
#Prepares the Eject object for removing the USB from the GREEN PC.
#Also creates the popup object that keeps the proces going if the user chooses to.

# !!!UPDATE THIS FILE PATH WITH EVERY NEW OSDBOOTMEDIA VERSION!!!!
# Latest version can be found here: \\usdata028\meisupport\OSD Boot Image\
##################################################################
$ISOfilePath = "C:\Users\stoorp\Documents\OSDBootMedia_V1.1.3B2.iso"
##################################################################

$Shell = New-Object -ComObject "Wscript.Shell"
$continueShell = New-Object -ComObject "Wscript.Shell"
$Eject = New-Object -ComObject Shell.Application
$USB = $continueShell.Popup("Put in a USB or click cancel to exit", 0, "Alert", 64+1)
$diskpartFilePath = "C:\users\stoorp\win10usb_diskpart_script.txt"

#While loop to keep the USB making process as long as you need it. Will keep running until you click cancel
while ($USB -eq 1)
{

#Beginning text
Write-Output "Starting..."

#This creates a .txt file with the diskpart instructions.
New-Item -Path "$diskpartFilePath" -ItemType file
Add-Content "$diskpartFilePath" "list disk"
Add-Content "$diskpartFilePath" "select disk 1"
Add-Content "$diskpartFilePath" "clean"
Add-Content "$diskpartFilePath" "convert MBR"
Add-Content "$diskpartFilePath" "convert GPT"
Add-Content "$diskpartFilePath" "create partition primary"
Add-Content "$diskpartFilePath" "select partition 1"
Add-Content "$diskpartFilePath" "format quick fs=fat32"
Add-Content "$diskpartFilePath" "exit"

#This launches Diskpart with the previously created instructions.
Diskpart /S "$diskpartFilePath"

#This sets disk nr.1 (The USB) as drive letter "Z" (the same USB will always be read as "Z" if re-inserted into this GREEN computer UPDATE: actually...I'm not sure this is the case...they don't seem to be "Z:" when I re-insert them...) .
#If A USB device already named "Z" is inserted into the GREEN PC when running this script, "-ErrorAction SilentlyContinue" will ignore the error message and keep the proces going.
#(The new drive letter "Z" is currently an implicit statement. When I get better at scripting I will look for a away to make the USB assigned drive letter an explicit statement).
Get-Partition -DiskNumber 1 | Set-Partition -NewDriveLetter Z -ErrorAction SilentlyContinue

#This mounts the ISO file, finds the drive letter and starts copying the files to the USB (it also deletes the .txt file we created in the beginning).
#The "-Path" of Copy-Item is also currently an implicit statment, I have not found an easy way to copy ALL files from the mounted ISO file.
#So instead, I just copied the files I already know about (from investigating the ISO file with my own eyes) one by one. I will continue working on making this an explicit statment.
Mount-DiskImage -ImagePath "$ISOfilePath"
$driveLetter = (Get-DiskImage -DevicePath \\.\CDROM0 | Get-Volume).DriveLetter
Remove-Item -Path "$diskpartFilePath"
Copy-Item -Path "${driveLetter}:\EFI", "${driveLetter}:\SMS", "${driveLetter}:\boot", "${driveLetter}:\sources", "${driveLetter}:\LaunchMedia.cmd", "${driveLetter}:\MediaLabel.txt", "${driveLetter}:\bootmgr", "${driveLetter}:\bootmgr.efi" -Destination "Z:\" -Recurse -Verbose

#This lets the script pause for about 20 seconds to make sure the USB can be ejected without any error messages.
Write-Output ""
Write-Output "Waiting for USB to finish copying..."
Write-Output ""
Start-Sleep -Seconds 20

#This part ejects the USB from the WIN10 PC (not physically, the act of right-clicking and selecting "safely eject") and unmounts the ISO file.
$Eject.NameSpace(17).ParseName("Z:").InvokeVerb("Eject")
Dismount-DiskImage -ImagePath "$ISOfilePath"

#This output shows when the Windows 10 USB file copying has been completed
Write-Output "-----------------------------"
Write-Output "Windows 10 Boot USB complete!"
Write-Output "-----------------------------"

#This keeps the popup box inside the while loop (the first one takes place outside the while-loop).
$USB = $continueShell.Popup("Put in a USB or click cancel to exit", 0, "Alert", 64+1)

}
# END OF SCRIPT
