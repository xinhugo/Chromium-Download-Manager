@echo off
cd..
Tools\shortcut.exe /A:C /F:"Chromium.lnk" /T:"%~dp0chrome-win32\chrome.exe" /P:"--no-first-run --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromeCache""" /W:"%~dp0chrome-win32"
if exist pepflashplayer.dll Tools\shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH.lnk" /T:"%~dp0chrome-win32\chrome.exe" /P:"--no-first-run --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromeCache" --ppapi-flash-path=%~dp0pepflashplayer.dll --ppapi-flash-version=17.0.0.134"" /W:"%~dp0chrome-win32"