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

$Source1 = 'D:\Wallpapers'
$Dest1 = '\\192.168.50.164\Personal_Vault\Jason_Safe\Photography_Backup\Wallpapers'

$Source2 = 'D:\HDD jason\Twitch Logos'
$Dest2 = '\\192.168.50.164\Personal_Vault\Jason_Safe\Jason_Documents\Twitch'

$Source3 = 'D:\HDD jason\Documents\Jason Misc. Important Stuff'
$Dest3 = '\\192.168.50.164\Personal_Vault\Jason_Safe\Jason_Documents'

$Source4 = 'D:\ISO_Library'
$Dest4 = '\\192.168.50.164\Personal_Vault\Jason_Safe\ISO_Library'

$Source5 = 'D:\jason\Photography'
$Dest5 = '\\192.168.50.164\Personal_Vault\Jason_Safe\Photography_Backup'

$Source6 = 'D:\HDD jason\Dungeons_and_Dragons\'
$Dest = '\\192.168.50.164\Dungeons_and_Dragons\'


#~~~~~~~~~~~~~~~~~ Script begins here ~~~~~~~~~~~~~~~~~

echo "------------------------------------------------------------------------------`r`n" > $LogLocal
robocopy $Source1 $Dest1 /s /e /b /z /xo /ts /tee /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source2 $Dest2 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source3 $Dest3 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source4 $Dest4 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source5 $Dest5 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
echo " " >>$LogLocal

robocopy $Source6 $Dest6 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
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

