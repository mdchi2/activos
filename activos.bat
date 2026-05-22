@echo off
set WifiName=md1

echo ========================================
echo    MONITOR DE WI-FI PARA CANALES YOUTUBE
echo ========================================
echo Por favor, asegurate de haber cambiado WifiName por el nombre de tu red.
echo Presiona Ctrl+C en cualquier momento para detener el script.
echo.

rem Desactivar el cartel de advertencia de Windows 7 en Chrome
reg add "HKCU\Software\Policies\Google\Chrome" /v SuppressUnsupportedOSWarning /t REG_DWORD /d 1 /f >nul 2>&1

:loop
echo [%TIME%] Conectando a la red Wi-Fi '%WifiName%'...
netsh wlan connect name="%WifiName%" >nul

echo Esperando 15 segundos...
timeout /t 15 /nobreak >nul

echo [%TIME%] Abriendo Google Chrome en pantalla completa...
start "" chrome.exe --incognito --start-fullscreen "https://mdchi2.github.io/activos/"

echo Esperando 30 segundos...
timeout /t 30 /nobreak >nul

echo [%TIME%] Desconectando Wi-Fi...
netsh wlan disconnect >nul

echo Esperando 300 segundos (5 minutos)...
timeout /t 300 /nobreak >nul

echo [%TIME%] Cerrando Google Chrome...
taskkill /IM chrome.exe /F >nul 2>&1

goto loop
