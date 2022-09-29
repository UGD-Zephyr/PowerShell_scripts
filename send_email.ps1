# Programmer: Per Stoor
# Date: 2021-12-10
# Last changed: 2022-09-28
# Type of script: Sending email through PowerShell.

$mailBodyText = Get-Content "Filepath to .txt file containing the body text."
$Outlook = New-Object -ComObject Outlook.Application

$Mail = $Outlook.CreateItem(0)
$Mail.To = "per.stoor@gmail.com"
$Mail.Subject = "Testing sending emails with PowerShell!"
$Mail.Body = "$mailBodyText"
$Mail.Send()

# Trying to think of ways to format the body of the email. Plain text in the script?
# Write in a formated wawy in a text file?
# Use HTML formatting somehow?
