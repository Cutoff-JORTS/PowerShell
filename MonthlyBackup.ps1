# Monthly Backup Script
# Author - jort
# Backs up (copy only new files) from $source to $destination with logs

#~~~~~~~~~~~~~~~~~ Establishing Variables ~~~~~~~~~~~~~~~~~ 
	#note - you can change source or destination folders here without touching code

$LogLocal = 'D:\Log_Files\Monthly-Backup-Log.txt'							#Local log = full detail
$ShortLog = 'D:\Log_Files\Monthly-Summary.txt'								#Local Log = summary
$LogRemote = '\\192.168.50.164\Personal_Vault\Monthly-Backup-Log.txt'		#Remote Log = full detail + summary


$NewXfers = Get-Content $LogLocal -ReadCount 1000 | foreach {$_ -match "New File"}
$FileCount = $NewXfers.count
$date= date

$Source3 = 'D:\Wallpapers'
$Dest1 = '\\192.168.50.164\Personal_Vault\Jason_Safe\Photography_Backup\Wallpapers'

$Source2 = 'D:\HDD jason\Twitch Logos'
$Source4 = 'D:\HDD jason\Documents\Jason Misc. Important Stuff'
$Dest2 = '\\192.168.50.164\Personal_Vault\Jason_Safe\Jason_Documents'

$Source5 = 'D:\ISO_Library'
$Dest3 = '\\192.168.50.164\Personal_Vault\Jason_Safe\ISO_Library'

$Source6 = 'D:\HDD jason\Photography'
$Dest4 = '\\192.168.50.164\Personal_Vault\Jason_Safe\Photography'

#~~~~~~~~~~~~~~~~~ Script begins here ~~~~~~~~~~~~~~~~~

echo "------------------------------------------------------------------------------`r`n" > $LogLocal
robocopy $Source1 $Dest1 /s /e /b /z /xo /ts /tee /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source2 $Dest2 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source3 $Dest1 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source4 $Dest2 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source5 $Dest3 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source6 $Dest4 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal

echo "------------------------------------------------------------------------------`r`n" >> $LogLocal

echo "======================================================================" > $ShortLog
echo '----------------------- S U M M A R Y --------------------------------' >> $ShortLog
echo "======================================================================`r`n" >> $ShortLog
echo "Total files added to archives: $FileCount" >> $ShortLog
echo " " >> $ShortLog
echo "Names of files added to archives: " >> $ShortLog
echo $NewXfers >> $ShortLog
echo "`r`n`- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" >> $ShortLog
echo "`r`nMost Recent Backup completed as of: $date" >> $ShortLog

copy $LogLocal $LogRemote
Get-Content -Path $ShortLog >> $LogRemote
exit 0

