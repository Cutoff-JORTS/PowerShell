#Test of my homemade "grep" function

# - - FAKE GREP - - #
$file='D:\HDD jason\Dungeons_and_Dragons\Active_Game_Notes\Thursday_OotA\Text_Notes\7_When_Gnolls_Attack.txt'
$string='gnoll'

function grep ($file,$string){
get-content $file -ReadCount 1000 |
 foreach { $_ -match "$string" }
}

grep $file $string > D:\Log_Files\texty.txt

