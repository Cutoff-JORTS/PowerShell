#PowerShell Script to map network drives for LAB-SERVER
#Author: Jort

#Umaps current drives:
net use * /delete

#Re-maps the drives:
net use x: \\192.168.50.60\Personal_Vault /savecred /p:yes
net use y: \\192.168.50.60\Dungeons_and_Dragons /savecred /p:yes
net use z: \\192.168.50.60\Media /savecred /p:yes

echo "Confirmed, drives are mapped. Exiting in 1s"
sleep 1
exit 0