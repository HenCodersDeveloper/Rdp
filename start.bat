@echo off

:: Konfigurasi server
echo Configuring server...
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" >nul 2>&1
net config server /srvcomment:"Windows Server Latest by @HenCoders" >nul 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F >nul 2>&1

:: Buat akun administrator
echo Creating administrator account...
net user administrator HenCoders2024 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul

:: Aktifkan layanan yang diperlukan
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start Audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul

echo Successfully Installed! If the RDP is dead, please rebuild again.
echo Starting Cloudflare Tunnel, please wait...

:: Jalankan Cloudflare Tunnel
start /b cloudflared.exe tunnel --url tcp://localhost:3389 --logfile cloudflared_log.txt >nul 2>&1

:: Tunggu beberapa detik untuk memastikan tunnel aktif
timeout 10 >nul

:: Cek apakah tunnel aktif dan menampilkan informasi hostname
findstr "trycloudflare.com" cloudflared_log.txt >nul
if %errorlevel%==0 (
    echo Cloudflare Tunnel is Active!
    findstr "trycloudflare.com" cloudflared_log.txt
) else (
    echo Cloudflare Tunnel Error: Please check your workflow logs for details.
    exit /b 1
)

:: Tampilkan kredensial RDP
echo Username: administrator
echo Password: HenCoders2024
echo Use the Cloudflare hostname displayed above to connect to your RDP.
ping -n 10 127.0.0.1 >nul
