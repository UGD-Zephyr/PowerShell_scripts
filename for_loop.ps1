# Programmer: Per Stoor
# Date: 2022-01-27
# Last changed: 2022-01-27
# Type of script: Fun and colorful for-loops

for ($i -eq 0; $i -le 300; $i++){

	Write-Host "$i" -ForegroundColor red

}

for ($j -eq 0; $j -le 300; $j++){
	
	Write-Host "	$j" -ForegroundColor blue

}

for ($k -eq 0; $k -le 300; $k++){
	
	Write-Host "		$k" -ForegroundColor green 

}

for ($l -eq 0; $l -le 300; $l++){
	
	Write-Host "			$l" -ForegroundColor yellow 

}

for ($m -eq 0; $m -le 300; $m++){
	
	Write-Host "				$m" -ForegroundColor magenta 

}

for ($n -eq 0; $n -le 300; $n++){
	
	Write-Host "					$n" -ForegroundColor cyan 

}

Start-Sleep -Seconds 2
Clear-Host

# END OF SCRIPT
