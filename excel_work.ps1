# Programmer: Per Stoor
# Date: 2022-05-10
# Last changed: 2022-05-10
# Type of script: Manipulating cells in excel files.

# A function to add Excel Worksheets in order from left to right (1, 2, 3...)
Function Add-Worksheet{

$lastSheet = $workbook.WorkSheets($workbook.WorkSheets.Count)
$newSheet = $workbook.WorkSheets.Add($lastSheet)
$lastSheet.Move($newSheet)

}

# A function to rename the added worksheets. Item(#) corresponds
# to where in the workbook the worksheet is placed
Function Rename-Worksheet{

$workSheet = $workbook.WorkSheets.Item(1)
$workSheet.Name = "Test 1"

}

# This is how you add text and formatting to cells in the worksheet
Function Add-WorksheetCells {

$workbook.ActiveSheet.Cells.Item(1,3).Font.Size = 18 
$workbook.ActiveSheet.Cells.Item(1,3).Font.Bold=$True 
$workbook.ActiveSheet.Cells.Item(1,3).Font.Name = "Cambria"
$workbook.ActiveSheet.Cells.Item(1,3).Font.ThemeFont = 1 
$workbook.ActiveSheet.Cells.Item(1,3).Font.ThemeColor = 4 
$workbook.ActiveSheet.Cells.Item(1,3).Font.ColorIndex = 55
$workbook.ActiveSheet.Cells.Item(1,3).Font.Color = 8210719
$workbook.ActiveSheet.Cells.Item(1,3) = "I added this!"

}

# This is how you auto-size the cells to fit the text 
Function Resize-Worksheet {

$usedRange = $workbook.ActiveSheet.UsedRange
$usedRange.EntireColumn.AutoFit() | Out-Null

}

$textFileFilepath = "C:\Users\stoorp\Programming\PS1\test_folder\Allphones2022_03.txt"
$textFile = Get-Content $textFileFilepath
$csvFile = ConvertTo-CSV -InputObject $textFile
$currentPath = Get-Location
$excelFile = New-Object -ComObject Excel.Application
$excelFile.Visible = $TRUE

$workbook = $excelFile.Workbooks.Add() 

$workbook.SaveAs("$currentPath\Test1")

# END OF SCRIPT
