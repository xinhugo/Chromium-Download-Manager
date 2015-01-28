@echo off
title Chromium-Download-Manager
PUSHD %~dp0
cd /d "%~dp0"

:Ver
Ver|Find /I "5.1" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "5.2" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "6.0" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "6.1" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "6.2" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Ver|Find /I "6.3" > nul 2>nul 2>nul
If "%ERRORLEVEL%"=="0" (Goto Files check)
Cls 
Echo 抱歉读取系统版本出错，请确定你的系统是否为Windows XP/2003/Vista/2008/7/2008 R2/8/8.1，按任意键退出。
Pause>nul
exit

:Files check
if not exist 7za_x86.exe  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    缺少 7za_x86.exe，请重新下载。&echo.&echo.&echo.&echo.&echo
if exist "aria2\aria2c.exe" set aria2c="aria2\aria2c.exe" &goto Main
if exist "D:\软件库\绿色工具\网络工具\上传下载\aria2\x64\aria2c.exe" set aria2c="D:\软件库\绿色工具\网络工具\上传下载\aria2\x64\aria2c.exe"
if not exist "aria2\aria2c.exe" if not exist "D:\软件库\绿色工具\网络工具\上传下载\aria2\x64\aria2c.exe"  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    缺少 aria2，请重新下载。&echo.&echo.&echo.&echo.&echo

:Main
cls
echo.
echo     即将 下载/配置 Chromium......
echo.&echo.
echo     1)下载：Chromium
echo     2)配置：解压缩、创建数据目录
echo     3)创建快捷方式（路径过长时，请用 Chromium.bat 或 Chromium-PPAPI-FLASH.bat）
echo.&echo.
echo     4)删除已下载的安装文件（避免不同文件错误地断点续传）
echo.
echo.&echo.
echo     致谢及声明：
echo     1)在 phuslu 的 chromium 项目基础上改进；
echo     2)调用了32位的 7-Zip 命令行版本用于解压缩；
echo     3)7-Zip 发布于 GNU LGPL 协议，www.7-zip.org 的能够找到其源代码；
echo     4)调用了 aria2 从 HTTP 服务器下载数据。
echo.&echo.
echo     版本：2015/1/28；开发：Phuslu，Hugo。
echo.
echo ---------------------------------------------------------------------------
echo.
SET /P ST=   请输入数字：
echo. 
if /I "%ST%"=="1" goto Download
if /I "%ST%"=="2" goto Config
if /I "%ST%"=="3" goto Link
if /I "%ST%"=="4" goto Delete
echo    无效选择，按任意键返回！
pause >nul
goto Main

:Download
cls
echo.
echo     即将 下载 Chromium......
echo.&echo. 
echo     将调用 %aria2c% 下载。
echo.&echo. 
echo     1)直接下载（不使用代理）
echo     2)自定义服务器下载（IP 地址/域名）
echo     3)代理下载（流量经 HTTP/HTTPS 本地代理客户端）
echo.
echo     4)返回主菜单
echo.&echo.
echo     致谢及声明：
echo     1)在 phuslu 的 chromium 项目基础上改进；
echo     2)调用了32位的 7-Zip 命令行版本用于解压缩；
echo     3)7-Zip 发布于 GNU LGPL 协议，www.7-zip.org 的能够找到其源代码；
echo     4)调用了 aria2 从 HTTP 服务器下载数据。
echo.&echo.
echo     版本：2015/1/28；开发：Phuslu，Hugo。
echo.
echo ---------------------------------------------------------------------------
echo.
SET /P ST=   请输入数字：
echo. 
if /I "%ST%"=="1" goto Download_Direct
if /I "%ST%"=="2" goto Download_Custom
if /I "%ST%"=="3" goto Download_Proxy
if /I "%ST%"=="4" goto Main
echo    无效选择，按任意键返回！
pause >nul
goto Download

:Download_Direct
set Server=www.google.com.hk
SET CA=--check-certificate=true
goto Download_Link

:Download_Custom
SET /P Server=   请输入 IP 地址/域名：
SET CA=--check-certificate=false
goto Download_Link

:Download_Proxy
set Server=www.google.com.hk
SET CA=--check-certificate=true
SET Proxy=--all-proxy=127.0.0.1:
SET /P Port=   请输入 HTTP/HTTPS 代理客户端的端口号：

:Download_Link
if not exist chrome-win32.zip.aria2 if exist chrome-win32.zip del chrome-win32.zip
if exist LAST_CHANGE del LAST_CHANGE
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o LAST_CHANGE --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/LAST_CHANGE
if not exist LAST_CHANGE goto Download_Link
(
    fc LAST_CHANGE chrome-win32\LAST_CHANGE
) && (
    echo Already Lastest Version ! && pause>NUL
) || (
    for /f %%I in (LAST_CHANGE) do (
        %aria2c% -c -s16 -x16 -k1m --remote-time=true %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o chrome-win32.zip --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/%%I/chrome-win32.zip
    )
) 
if not exist chrome-win32.zip goto Download_Link

:Config
(
    if exist chrome-win32 rd /s /q chrome-win32
    7za_x86 x chrome-win32.zip
) && (
    copy /y LAST_CHANGE "chrome-win32\LAST_CHANGE"
) && (
    if not exist "chrome-win32\plugins" (md "chrome-win32\plugins")
    for %%I in ("np*.dll") do (
      copy /y "%%~I" "chrome-win32\plugins\%%~nxI"
    )
) && (
    if not exist "%~dp0Data" (md "%~dp0Data")
) 
goto Finish

:Link
shortcut.exe /A:C /F:"Chromium.lnk" /T:"%~dp0chrome-win32\chrome.exe" /P:"--no-first-run --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromeCache""" /W:"%~dp0chrome-win32"
shortcut.exe /A:C /F:"Chromium-PPAPI-FLASH.lnk" /T:"%~dp0chrome-win32\chrome.exe" /P:"--no-first-run --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromeCache" --ppapi-flash-path=%~dp0pepflashplayer.dll --ppapi-flash-version=16.0.0.296"" /W:"%~dp0chrome-win32"
goto Finish

:Delete
if exist chrome-win32.zip del chrome-win32.zip
if exist chrome-win32.zip.aria2 del chrome-win32.zip.aria2

:Finish
echo.&echo    处理完成，按任意键返回。
pause >nul &goto Main