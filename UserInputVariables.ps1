#Passing Variables to Functions

Function Congratulate-User ($CodePhrase){
	Write-Host "`r`nCongratulations, you can read and follow directions. Please proceed to the final testing chamber for cake.`r`n"
}

Do {
cls
$CodePhrase = Read-Host "Please enter the correct answer (hint: correct answer is MoonRocks)"
}
Until ($CodePhrase -eq "MoonRocks")

Congratulate-User $CodePhrase