@echo off

del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" >nul 2>&1
net config server /srvcomment:"Windows Server Latest by @HenCoders" >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F >nul 2>&1
net user administrator HenCoders2024 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start Audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul

echo Successfully Installed! If the RDP is dead, please rebuild again.
echo Checking Serveo Tunnel...

:: Menyimpan output subdomain Serveo
ssh -R 3389:localhost:3389 serveo.net > serveo_log.txt 2>&1

:: Menampilkan subdomain Serveo di konsol
findstr "Forwarding" serveo_log.txt || echo "Serveo Tunnel Error: Please check your workflow logs for details."

echo Username: administrator
echo Password: HenCoders2024
echo Please log in to your RDP using the Serveo subdomain displayed above.
ping -n 10 127.0.0.1 >nul
