# Programmer: Per Stoor
# Date: 2021-12-25
# Last changed: 2022-09-29
# Type of script: Mass ping sript. 

# !Make sure to change the path values for $IPnumbers to match your environment!
$BIZTEL 		= "Path to file containin IP numbers" 
$Chiba 			= "Path to file containin IP numbers" 
$Fukuoka 		= "Path to file containin IP numbers"
$Hiroshima 		= "Path to file containin IP numbers"
$IVKK_OSAKA 	= "Path to file containin IP numbers"
$Kanazawa 		= "Path to file containin IP numbers"
$Kobe 			= "Path to file containin IP numbers"
$Kumamoto 		= "Path to file containin IP numbers"
$Kyoto 			= "Path to file containin IP numbers"
$Matsumoto 		= "Path to file containin IP numbers"
$Morioka 		= "Path to file containin IP numbers"
$Nagoya 		= "Path to file containin IP numbers"
$Nihonbashi 	= "Path to file containin IP numbers"
$Niigata 		= "Path to file containin IP numbers"
$Osaka 			= "Path to file containin IP numbers"
$Saitama 		= "Path to file containin IP numbers"
$Sapporo 		= "Path to file containin IP numbers"
$Sendai 		= "Path to file containin IP numbers"
$Tachikawa 		= "Path to file containin IP numbers"
$Takamatsu 		= "Path to file containin IP numbers"
$Tokyo_HQ 		= "Path to file containin IP numbers"
$Tokyo_Shinjuku = "Path to file containin IP numbers"
$Utsunomiya 	= "Path to file containin IP numbers"
$Yokohama 		= "Path to file containin IP numbers"
$all_switches	= "Path to file containin IP numbers"
$custom_IP_list = "Path to file containin IP numbers"

[Int32]$amount_of_IP_numbers = 0

while ($userChoice -ne 0){

Clear-Host
 	
Write-Output " ------------------------------------------------------"
Write-Output "|                 Mass Ping Tool v.1.0                 |"
Write-Output " ------------------------------------------------------"

Write-Output "Please choose which local office you would like to ping."
Write-Output "1.  BIZTEL       13. Nihonbashi       25. Ping all switches in all offices"
Write-Output "2.  Chiba        14. Niigata          26. Freely enter which IP address(s) to ping"
Write-Output "3.  Fukuoka      15. Osaka"
Write-Output "4.  Hiroshima    16. Saitama"
Write-Output "5.  IVKK_Osaka   17. Sapporo"
Write-Output "6.  Kanazawa     18. Sendai"
Write-Output "7.  Kobe         19. Tachikawa"
Write-Output "8.  Kumamoto     20. Takamatsu"
Write-Output "9.  Kyoto        21. Tokyo_HQ"
Write-Output "10. Matsumoto    22. Tokyo_Shinjuku"
Write-Output "11. Morioka      23. Utsunomiya"
Write-Output "12. Nagoya       24. Yokohama"

$userChoice = Read-Host -Prompt "`nPlease select which regional office to ping or [0] (zero) to quit"

if ($userChoice -eq 0){

Break 

}

elseif ($userChoice -eq 1){

	$IPnumbers = Get-Content -Path "$BIZTEL"

}
elseif ($userChoice -eq 2){

	$IPnumbers = Get-Content -Path "$Chiba"

}
elseif ($userChoice -eq 3){

	$IPnumbers = Get-Content -Path "$Fukuoka"

}elseif ($userChoice -eq 4){

	$IPnumbers = Get-Content -Path "$Hiroshima"

}elseif ($userChoice -eq 5){

	$IPnumbers = Get-Content -Path "$IVKK_OSAKA"

}elseif ($userChoice -eq 6){

	$IPnumbers = Get-Content -Path "$Kanazawa"

}elseif ($userChoice -eq 7){

	$IPnumbers = Get-Content -Path "$Kobe"

}elseif ($userChoice -eq 8){

	$IPnumbers = Get-Content -Path "$Kumamoto"

}elseif ($userChoice -eq 9){

	$IPnumbers = Get-Content -Path "$Kyoto"

}elseif ($userChoice -eq 10){

	$IPnumbers = Get-Content -Path "$Matsumoto"

}elseif ($userChoice -eq 11){

	$IPnumbers = Get-Content -Path "$Morioka"

}elseif ($userChoice -eq 12){

	$IPnumbers = Get-Content -Path "$Nagoya"

}elseif ($userChoice -eq 13){

	$IPnumbers = Get-Content -Path "$Nihonbashi"

}elseif ($userChoice -eq 14){

	$IPnumbers = Get-Content -Path "$Niigata"

}elseif ($userChoice -eq 15){

	$IPnumbers = Get-Content -Path "$Osaka"

}elseif ($userChoice -eq 16){

	$IPnumbers = Get-Content -Path "$Saitama"

}elseif ($userChoice -eq 17){

	$IPnumbers = Get-Content -Path "$Sapporo"

}elseif ($userChoice -eq 18){

	$IPnumbers = Get-Content -Path "$Sendai"

}elseif ($userChoice -eq 19){

	$IPnumbers = Get-Content -Path "$Tachikawa"

}elseif ($userChoice -eq 20){

	$IPnumbers = Get-Content -Path "$Takamatsu"

}elseif ($userChoice -eq 21){

	Write-Output "`n* Pingin all Tokyo HQ switches will take approximately 10 minutes..."
	$IPnumbers = Get-Content -Path "$Tokyo_HQ"

}elseif ($userChoice -eq 22){

	$IPnumbers = Get-Content -Path "$Tokyo_Shinjuku"

}elseif ($userChoice -eq 23){

	$IPnumbers = Get-Content -Path "$Utsunomiya"

}elseif ($userChoice -eq 24){

	$IPnumbers = Get-Content -Path "$Yokohama"

}elseif ($userChoice -eq 25){

	Write-Output "`n* Pingin all available switches will take approximately 10 minutes..."
	$IPnumbers = Get-Content -Path "$all_switches"

}elseif ($userChoice -eq 26){

	Write-Output "`nPlease enter desired IP addresses into the notepadfile and save it."
	Write-Output "After saving the notepad file resume the mass_ping_script.ps1 script."

	Start-Process Notepad -Path $custom_IP_list
	Write-Output "Press enter to continue..."
	Read-Host
	$IPnumbers = Get-Content -Path "$custom_IP_list"

}else {

	Write-Output "`nPlease only enter 0-24..."
	Break

}

 ForEach ($number in $IPnumbers){

 	$amount_of_IP_numbers++
 	}

 	Write-Output "`nPinging from prepared list..."
 	Write-Output "$amount_of_IP_numbers IP number(s) are being pinged."
	Write-Output "--------------------------------"

 	ForEach ($value in $IPnumbers){

			if ((Test-Connection -BufferSize 32 -TimeoutSeconds 1 $value).Status -eq "Success"){

				Write-Host "$value " -NoNewLine
				Write-Host "	Success" -ForeGroundColor Green

			}
			elseif ((Test-Connection -BufferSize 32 -TimeoutSeconds 1 $value).Status -eq "TimedOut") {

				Write-Host "$value " -NoNewLine
				Write-Host "	TimedOut" -ForeGroundColor Red

			}

								

	}

Write-Output "`nPress enter to continue..."
Read-Host

# Resetting amount of IP numbers back to zero for the next iteration.
[Int32]$amount_of_IP_numbers = 0

} # End of while loop bracket "}"

Write-Output "`nMass Ping script complete..."

# END OF SCRIPT
