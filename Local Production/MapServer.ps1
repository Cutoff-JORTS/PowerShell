#PowerShell Script to map network drives for LAB-SERVER
#Author: Jort

#Umaps current drives:
net use * /delete

#Re-maps the drives:
net use x: \\LAB-SERVER\Personal_Vault /savecred /p:yes
net use y: \\LAB-SERVER\Dungeons_and_Dragons /savecred /p:yes
net use z: \\LAB-SERVER\Media /savecred /p:yes

echo "Confirmed, drives are mapped. Exiting in 1s"
sleep 1
exit 0