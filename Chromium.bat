@echo off
title Chromium ������
if not exist chrome-win32\chrome.exe  echo.&echo.&echo.&echo.&echo.&echo.&echo                          δ���� chrome-win32\chrome.exe����������˳���&echo.&echo.&echo.&echo.&echo                                         �����������&pause>nul& exit
:Main
cls
echo.&echo.
echo     ��Ҫ������
echo.&echo.
echo     1)Chromium
echo     2)Chromium-PPAPI-FLASH
echo.
echo     3)Chromium Ӧ��������
echo     4)Chromium-PPAPI-FLASH Ӧ��������
echo.&echo.
echo ---------------------------------------------------------------------------
echo.
Set /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Chromium
if /I "%ST%"=="2" goto Chromium-PPAPI-FLASH
if /I "%ST%"=="3" goto Chromium-APP
if /I "%ST%"=="4" goto Chromium-PPAPI-FLASH-APP
echo    ��Чѡ�񣬰���������أ�
pause >nul
goto Main

:Chromium
start %~dp0chrome-win32\chrome.exe --User-data-dir=%~dp0Data --disk-cache-dir=%USERPROFILE%\ChromiumCache
exit

:Chromium-PPAPI-FLASH
if not exist pepflashplayer.dll  echo.&echo.&echo.&echo.&echo.&echo.&echo                                  δ���� pepflashplayer.dll��&echo.&echo.&echo.&echo.&echo                                         �����������&pause>nul& goto Main
start %~dp0chrome-win32\chrome.exe --User-data-dir=%~dp0Data --disk-cache-dir=%USERPROFILE%\ChromiumCache --ppapi-flash-path=%~dp0pepflashplayer.dll --ppapi-flash-version=17.0.0.134
exit

:Chromium-APP
start %~dp0chrome-win32\chrome.exe --User-data-dir=%~dp0Data --disk-cache-dir=%USERPROFILE%\ChromiumCache  --show-app-list
exit

:Chromium-PPAPI-FLASH-APP
if not exist pepflashplayer.dll  echo.&echo.&echo.&echo.&echo.&echo.&echo                                  δ���� pepflashplayer.dll��&echo.&echo.&echo.&echo.&echo                                         �����������&pause>nul& goto Main
start %~dp0chrome-win32\chrome.exe --User-data-dir=%~dp0Data --disk-cache-dir=%USERPROFILE%\ChromiumCache  --show-app-list --ppapi-flash-path=%~dp0pepflashplayer.dll --ppapi-flash-version=17.0.0.134
exit