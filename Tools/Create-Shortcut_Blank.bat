@echo off
cd /d "%~dp0"
cd..
Tools\shortcut.exe /A:C /F:"Chromium.lnk" /T:"%cd%\Application\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache"""" /W:"%cd%\Application" /D:"���ʻ�����"
Tools\shortcut.exe /A:C /F:"Chromium Ӧ��������.lnk" /T:"%cd%\Application\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache""" --show-app-list" /W:"%cd%\Application"  /I:"%cd%\Application\chrome.exe,1" /D:"Chromium Ӧ��������"
if not exist pepflashplayer.dll exit
Tools\shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH.lnk" /T:"%cd%\Application\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache""" --ppapi-flash-path="""%cd%\pepflashplayer.dll""" --ppapi-flash-version=17.0.0.188" /W:"%cd%\Application" /D:"���ʻ�����"
Tools\shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH Ӧ��������.lnk" /T:"%cd%\Application\chrome.exe" /P:--User-data-dir=""""%cd%\Data""" --disk-cache-dir="""%USERPROFILE%\ChromiumCache""" --show-app-list --ppapi-flash-path="""%cd%\pepflashplayer.dll""" --ppapi-flash-version=17.0.0.188" /W:"%cd%\Application"  /I:"%cd%\Application\chrome.exe,1" /D:"Chromium-PPAPI-FLASH Ӧ��������"
exit