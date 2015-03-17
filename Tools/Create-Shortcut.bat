@echo off
cd /d "%~dp0"
cd..
Tools\shortcut.exe /A:C /F:"Chromium.lnk" /T:"%cd%\chrome-win32\chrome.exe" /P:"--no-first-run --User-data-dir="%cd%\Data" --disk-cache-dir="%USERPROFILE%\ChromeCache""" /W:"%cd%\chrome-win32"
if exist pepflashplayer.dll Tools\shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH.lnk" /T:"%cd%\chrome-win32\chrome.exe" /P:"--no-first-run --User-data-dir="%cd%\Data" --disk-cache-dir="%USERPROFILE%\ChromeCache" --ppapi-flash-path=%cd%\pepflashplayer.dll --ppapi-flash-version=17.0.0.134"" /W:"%cd%\chrome-win32"
pause