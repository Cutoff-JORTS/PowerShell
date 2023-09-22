# Code Snippets to copy/paste

# - - FAKE GREP - - #
$file=filepath.txt
$string='string goes here'
function grep ($file,$string){
get-content $file -ReadCount 1000 |
 foreach { $_ -match "$string" }
}
#Syntax to use:> grep $file $string