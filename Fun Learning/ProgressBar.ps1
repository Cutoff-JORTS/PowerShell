#Progress Bar
For ($N = 1; $N -le 100; $N++ )
{
#	Write-Progress -ID 0 "$N% Complete"
	Write-Progress -Activity "Progress" -Status "$N% Complete:"
	Start-Sleep -Milliseconds 250
}