# Programmer: Per Stoor
# Date: 2022-03-30
# Last changed: 2022-03-30
# Type of script: when corporations sends many useless files and renaming them is a pain.
# This script renames the files faster. 

$folderPath = Read-Host -Prompt "Enter folder path"
$companyName = Read-Host -Prompt "Enter company name"

# This is the manual way to know the file extenstion.
# $fileType = Read-Host -Prompt "Enter file type"

# This is the automatic way to know the file extenstion.
$fileType = (Get-Childitem -Path $folderPath -Recurse | Select-Object PSParentPath, Extension -Unique).Extension

$fileNameInText = @(Get-ChildItem -Path $folderPath).name

Set-Location -Path $folderPath

ForEach ($name in $fileNameInText) {
	
	$numberString = $name -replace "[^0-9]", ""
	Rename-Item $name -NewName "${numberString}_${companyName}${fileType}"

	}

Set-Location -Path $HOME
Start-Process $folderPath

# END OF SCRIPT
