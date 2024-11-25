@echo off
echo RDP CREATION SUCCESSFUL!
tasklist | find /i "ssh.exe" >nul && goto check || echo "Unable to get Serveo tunnel. Please ensure the workflow logs show a valid Serveo subdomain." & ping 127.0.0.1 >nul & exit
:check
ping 127.0.0.1 >nul
cls
echo RDP CREATION SUCCESSFUL!
goto check
