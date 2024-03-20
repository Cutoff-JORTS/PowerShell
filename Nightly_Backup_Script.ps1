# Rudimentary Backup Script
# Author: jort
# Backs up (copy only new files) from $source to $destination with logs

#~~~~~~~~~~~~~~~~~ Establishing Variables ~~~~~~~~~~~~~~~~~ 
	#note - you can change source or destination folders here without touching code

$LogLocal = 'D:\Log_Files\Nightly-Backup-Log.txt'							#Local log = full detail
$ShortLog = 'D:\Log_Files\Nightly-Summary.txt'								#Local Log = summary
$LogRemote = '\\192.168.50.164\Personal_Vault\Nightly-Backup-Log.txt'		#Remote Log = full detail + summary

$date= date

$Source1 = 'D:\HDD jason\Dungeons_and_Dragons\'
$Dest1 = '\\192.168.50.164\Dungeons_and_Dragons\'

$Source2 = 'D:\HDD jason\Documents\Jason Misc. Important Stuff'
$Dest2 = '\\192.168.50.164\Personal_Vault\Jason_Safe\Jason_Documents'

$Source3 = 'D:\HDD jason\Videos'
$Dest3 = '\\192.168.50.164\Personal_Vault\Jason_Safe\Videos'

#~~~~~~~~~~~~~~~~~ Script begins here ~~~~~~~~~~~~~~~~~

echo "------------------------------------------------------------------------------`r`n" > $LogLocal
robocopy $Source1 $Dest1 /s /e /b /z /xo /ts /tee /np /log+:$LogLocal
echo " " >>$LogLocal
echo "------------------------------------------------------------------------------`r`n" >> $LogLocal

echo "------------------------------------------------------------------------------`r`n" >> $LogLocal
robocopy $Source2 $Dest2 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal
echo "------------------------------------------------------------------------------`r`n" >> $LogLocal

echo "------------------------------------------------------------------------------`r`n" >> $LogLocal
robocopy $Source3 $Dest3 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal
echo "------------------------------------------------------------------------------`r`n" >> $LogLocal


$NewXfers = {Get-Content $LogLocal -ReadCount 1000 | foreach {$_ -match "New File"}}
$FileCount = @($NewXfers).Count


echo "======================================================================" > $ShortLog
echo '----------------------- S U M M A R Y --------------------------------' >> $ShortLog
echo "======================================================================`r`n" >> $ShortLog
echo "Total files added to archives: $(@($NewXfers).Count)" >> $ShortLog
echo " " >> $ShortLog
echo "Names of files added to archives:" >> $ShortLog
$NewXfers | ForEach-Object { echo $_ >> $ShortLog }
echo "`r`n`- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" >> $ShortLog
echo "`r`nMost Recent Backup completed as of: $date" >> $ShortLog

copy $LogLocal $LogRemote
Get-Content -Path $ShortLog >> $LogRemote
exit 0

