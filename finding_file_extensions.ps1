# Programmer: Per Stoor
# Date: 2022-03-30
# Last changed: 2022-03-30
# Type of script: Script to find file extensions.

$folderPath = "C:\Users\stoorp\Programming\PS1\test_folder2"
(Get-Childitem -Path $folderPath -Recurse | Select-Object PSParentPath, Extension -Unique).Extension

# END OF SCRIPT
