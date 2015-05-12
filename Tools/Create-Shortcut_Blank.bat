@echo off
cd /d "%~dp0"
cd..
Tools\shortcut.exe /A:C /F:"Chromium.lnk" /T:"%cd%\Application\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache"""" /W:"%cd%\Application" /D:"访问互联网"
Tools\shortcut.exe /A:C /F:"Chromium 应用启动器.lnk" /T:"%cd%\Application\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache""" --show-app-list" /W:"%cd%\Application"  /I:"%cd%\Application\chrome.exe,1" /D:"Chromium 应用启动器"
if not exist pepflashplayer.dll exit
Tools\shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH.lnk" /T:"%cd%\Application\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache""" --ppapi-flash-path="""%cd%\pepflashplayer.dll""" --ppapi-flash-version=17.0.0.188" /W:"%cd%\Application" /D:"访问互联网"
Tools\shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH 应用启动器.lnk" /T:"%cd%\Application\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache""" --show-app-list --ppapi-flash-path="""%cd%\pepflashplayer.dll""" --ppapi-flash-version=17.0.0.188" /W:"%cd%\Application"  /I:"%cd%\Application\chrome.exe,1" /D:"Chromium-PPAPI-FLASH 应用启动器"
exit