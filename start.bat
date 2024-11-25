@echo off

del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" >nul 2>&1
net config server /srvcomment:"Windows Server Latest by @HenCoders" >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F >nul 2>&1
net user administrator HenCoders2024 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
net user installer /delete >nul 2>&1
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start Audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul

echo Successfully Installed! If the RDP is dead, please rebuild again.
echo Checking Serveo Tunnel...
tasklist | find /i "ssh.exe" >nul && echo Serveo Tunnel is Active || echo Serveo tunnel is not running. Please ensure the workflow logs show a valid Serveo subdomain.

echo IP: serveo.net
echo Username: administrator
echo Password: HenCoders2024
echo Please log in to your RDP using the Serveo subdomain displayed in the workflow logs.
ping -n 10 127.0.0.1 >nul
