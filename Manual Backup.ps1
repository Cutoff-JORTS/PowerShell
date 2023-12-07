# Rudimentary Backup Script
# Author: jort
# Backs up (copy only new files) from $source to $destination with logs

#~~~~~~~~~~~~~~~~~ Establishing Variables ~~~~~~~~~~~~~~~~~ 
	#note - you can change source or destination folders here without touching code

$LogLocal = 'FILEPATH_GOES_HERE'						#Local log = full detal
$ShortLog = 'FILEPATH_GOES_HERE'						#Local Log = summay
#$LogRemote = 'FILEPATH_GOES_HERE'						#*Optional - Uncomment to include (full detail + summay)


$NewXfers = Get-Content $LogLocal -ReadCount 1000 | foreach {$_ -match "New File"}
$FileCount = $NewXfers.count
$date= date

$Source1 = 'FILEPATH_GOES_HERE'
$Dest1 = 'FILEPATH_GOES_HERE'

$Source2 = 'FILEPATH_GOES_HERE'
$Dest2 = 'FILEPATH_GOES_HERE'

#~~~~~~~~~~~~~~~~~ Script begins here ~~~~~~~~~~~~~~~~~

echo "------------------------------------------------------------------------------`r`n" > $LogLocal
robocopy $Source1 $Dest1 /s /e /b /z /xo /ts /tee /np /log+:$LogLocal
echo " " >>$LogLocal
echo "------------------------------------------------------------------------------`r`n" >> $LogLocal

echo "------------------------------------------------------------------------------`r`n" >> $LogLocal
robocopy $Source2 $Dest2 /s /e /b /z /xo /ts /tee /ns /np /log+:$LogLocal
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

