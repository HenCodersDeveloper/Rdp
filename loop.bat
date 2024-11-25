@echo off
echo RDP CREATION SUCCESSFUL!
tasklist | find /i "loclx.exe" >Nul && goto check || echo "Unable to get LocalXpose tunnel, make sure LocalXpose authentication is correct in Settings > Secrets > Repository Secret. Maybe your previous VM is still running." & ping 127.0.0.1 >Nul & exit
:check
ping 127.0.0.1 > null
cls
echo RDP CREATION SUCCESSFUL!
goto check