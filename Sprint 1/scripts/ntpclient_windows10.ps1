# Configuration du client ntp
#
$TEXT = "/config /manualpeerlist:"10.0.X.0" /syncfromflags:manual /update"
$CMDCOMMAND = "C:\Windows\System32\w32tm.exe"
Start-Process '"$CMDCOMMAND" $TEXT'
