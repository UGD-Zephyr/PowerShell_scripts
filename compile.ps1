# Programmer: Per Stoor
# Date: 2021-09-09
# Last Changed: 2021-09-09
# Type of Script: A simple gcc compilation Script.

$cCodeFileName = Read-Host -Prompt "Enter file name"

Start-Process -NoNewWindow -FilePath "C:\ProgramData\Strawberry\c\bin\gcc.exe" -ArgumentList "-o $cCodeFileName $cCodeFileName.c"

#End of Script
