#Learning Functions

Function do-the-thing {
	Write-Host "You called your function. What, do you want a cookie or something? Back to work.`r`n"
}

cls
Try {do-the-thing}
Catch {Write-Host "ERROR `r`n Great job, dipshit, you broke something."}