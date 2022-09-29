# Programmer: Per Stoor
# Date: 2022-05-06
# Last change: 2022-05-06
# Type of script: Making a new Excel file with PowerShell (Since you can't use New-Item effectively)

$filePath = (Get-Location)

$excelFile = New-Object -ComObject excel.application
$excelFile.visible = $True
$workbook = $excelFile.Workbooks.Add() | Out-Null

# END OF SCRIPT
