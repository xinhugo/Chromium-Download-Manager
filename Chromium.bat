@echo off
title Chromium 启动器
if not exist Application\chrome.exe  echo.&echo.&echo.&echo.&echo.&echo.&echo                          未发现 Application\chrome.exe，按任意键退出。&echo.&echo.&echo.&echo.&echo                                         按任意键返回&pause>nul& exit
:Main
cls
echo.&echo.
echo     你要启动：
echo.&echo.
echo     1)Chromium
echo     2)Chromium-PPAPI-FLASH
echo.
echo     3)Chromium 应用启动器
echo     4)Chromium-PPAPI-FLASH 应用启动器
echo.&echo.
echo ---------------------------------------------------------------------------
echo.
Set /P ST=   请输入数字：
echo. 
if /I "%ST%"=="1" goto Chromium
if /I "%ST%"=="2" goto Chromium-PPAPI-FLASH
if /I "%ST%"=="3" goto Chromium-APP
if /I "%ST%"=="4" goto Chromium-PPAPI-FLASH-APP
echo    无效选择，按任意键返回！
pause >nul
goto Main

:Chromium
start "Chromium" "%~dp0Application\chrome.exe" --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromiumCache"
exit

:Chromium-PPAPI-FLASH
if not exist pepflashplayer.dll  echo.&echo.&echo.&echo.&echo.&echo.&echo                                  未发现 pepflashplayer.dll。&echo.&echo.&echo.&echo.&echo                                         按任意键返回&pause>nul& goto Main
start "Chromium"  "%~dp0Application\chrome.exe" --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromiumCache" --ppapi-flash-path="%~dp0pepflashplayer.dll" --ppapi-flash-version=17.0.0.169
exit

:Chromium-APP
start "Chromium"  "%~dp0Application\chrome.exe" --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromiumCache"  --show-app-list
exit

:Chromium-PPAPI-FLASH-APP
if not exist pepflashplayer.dll  echo.&echo.&echo.&echo.&echo.&echo.&echo                                  未发现 pepflashplayer.dll。&echo.&echo.&echo.&echo.&echo                                         按任意键返回&pause>nul& goto Main
start "Chromium"  "%~dp0Application\chrome.exe" --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromiumCache"  --show-app-list --ppapi-flash-path="%~dp0pepflashplayer.dll" --ppapi-flash-version=17.0.0.169
exit