# New Backup Script
# by: JORT

# Define paths and log file
$LogLocal = 'D:\Log_Files\Nightly-Backup-Log.txt'

# Define individual source and destination paths
$Source1 = 'D:\HDD jason\Dungeons_and_Dragons\'
$Dest1 = 'Y:\'

$Source2 = 'D:\HDD jason\Documents\Jason Misc. Important Stuff'
$Dest2 = 'X:\Jason_Safe'

$Source3 = 'D:\HDD jason\Pictures'
$Dest3 = 'X:\Jason_Safe'

# Parameters for Robocopy
$robocopyParams = "/E /XO /COPYALL /R:3 /W:10 /LOG+:`"$LogLocal`" /NFL /NDL"

# Write header to log file
$header = @"
======================================================================
----------------------- S U M M A R Y --------------------------------
======================================================================


Most Recent Backup completed as of: $(Get-Date)
"@
$header | Out-File -FilePath $LogLocal -Append

# Helper function to execute Robocopy
function Run-Robocopy {
    param (
        [string]$Source,
        [string]$Destination
    )
    Write-Output "Backing up $Source to $Destination" | Out-File -Append $LogLocal

    # Build arguments for Robocopy
    $arguments = "`"$Source`" "`"$Destination`" $robocopyParams"

    # Execute Robocopy
    Start-Process -FilePath "robocopy" -ArgumentList $arguments -NoNewWindow -Wait
}

# Backup Source1 to Dest1
Run-Robocopy -Source $Source1 -Destination $Dest1

# Backup Source2 to Dest2
Run-Robocopy -Source $Source2 -Destination $Dest2

# Backup Source3 to Dest3
Run-Robocopy -Source $Source3 -Destination $Dest3

Write-Output "Backup completed at $(Get-Date)" | Out-File -Append $LogLocal
