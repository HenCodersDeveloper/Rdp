@echo off
echo RDP CREATION SUCCESSFUL!

:: Memeriksa apakah Cloudflared tunnel berjalan
tasklist | find /i "cloudflared.exe" >nul && goto check || echo "Unable to get Cloudflare tunnel. Please ensure the workflow logs show a valid Cloudflare hostname." & ping 127.0.0.1 >nul & exit

:check
:: Memastikan server masih berjalan
ping 127.0.0.1 >nul
cls
echo RDP CREATION SUCCESSFUL!
goto check
