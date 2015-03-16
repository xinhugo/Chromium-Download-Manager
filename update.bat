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
if not exist 7za_x86.exe  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    缺少 7za_x86.exe，请重新下载。&echo.&echo.&echo.&echo.&echo                                         按任意键退出&pause>nul& exit
if exist "aria2\aria2c.exe" Set aria2c="aria2\aria2c.exe" &goto Main
if exist "D:\软件库\绿色工具\网络工具\上传下载\aria2\x64\aria2c.exe" Set aria2c="D:\软件库\绿色工具\网络工具\上传下载\aria2\x64\aria2c.exe"
if not exist "aria2\aria2c.exe" if not exist "D:\软件库\绿色工具\网络工具\上传下载\aria2\x64\aria2c.exe"  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    缺少 aria2，请重新下载。&echo.&echo.&echo.&echo.&echo                                         按任意键退出&pause>nul& exit

:Main
cls
echo.
echo     即将 下载/配置 Chromium......
echo.&echo.
echo     1)下载：Chromium
echo     2)配置：解压缩、创建用户数据目录及快捷方式
echo     3)创建快捷方式（路径过长时，请用 Chromium.bat 或 Chromium-PPAPI-FLASH.bat）
echo.
echo     4)更新：PPAPI-FLASH（pepflashplayer.dll,Chromium-PPAPI-FLASH.lnk,Chromium-PPAPI-FLASH.bat）
echo.&echo.
echo     5)删除已下载的文件（避免不同文件错误地断点续传）
echo.
echo.&echo.
echo     致谢及声明：
echo     1)在 phuslu 的 chromium 项目基础上改进；
echo     2)调用了32位的 7-Zip 命令行版本用于解压缩；
echo     3)7-Zip 发布于 GNU LGPL 协议，www.7-zip.org 的能够找到其源代码；
echo     4)调用了 aria2 从 HTTP 服务器下载数据。
echo.&echo.
echo     版本：2015/3/17；开发：Hugo。
echo.
echo ---------------------------------------------------------------------------
echo.
Set /P ST=   请输入数字：
echo. 
if /I "%ST%"=="1" goto Download
if /I "%ST%"=="2" goto Config
if /I "%ST%"=="3" goto Shortcut
if /I "%ST%"=="4" goto Flash
if /I "%ST%"=="5" goto Delete
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
echo     1)直接下载（www.google.co.jp）
echo.
echo     2)直接下载（www.google.com.hk）
echo     3)直接下载（dl.google.com）
echo.&echo. 
echo     4)自定义服务器下载（IP 地址/域名）
echo     5)代理下载（流量经 HTTP/HTTPS 本地代理客户端）
echo.
echo     4)返回主菜单
echo.&echo.
echo     致谢及声明：
echo     1)在 phuslu 的 chromium 项目基础上改进；
echo     2)调用了32位的 7-Zip 命令行版本用于解压缩；
echo     3)7-Zip 发布于 GNU LGPL 协议，www.7-zip.org 的能够找到其源代码；
echo     4)调用了 aria2 从 HTTP 服务器下载数据。
echo.&echo.
echo     版本：2015/3/17；开发：Hugo。
echo.
echo ---------------------------------------------------------------------------
echo.
Set /P ST=   请输入数字：
echo. 
if /I "%ST%"=="1" goto Download_Direct_1
if /I "%ST%"=="2" goto Download_Direct_2
if /I "%ST%"=="3" goto Download_Direct_3
if /I "%ST%"=="4" goto Download_Custom
if /I "%ST%"=="5" goto Download_Proxy
if /I "%ST%"=="6" goto Main
echo    无效选择，按任意键返回！
pause >nul
goto Download

:Download_Direct_1
Set Server=www.google.co.jp
Set CA=--check-certificate=true
goto Download_Link

:Download_Direct_2
Set Server=www.google.com.hk
Set CA=--check-certificate=true
goto Download_Link

:Download_Direct_3
Set Server=dl.google.com
Set CA=--check-certificate=true
goto Download_Link

:Download_Custom
Set /P Server=   请输入 IP 地址/域名：
Set CA=--check-certificate=false
goto Download_Link

:Download_Proxy
Set Server=www.google.com.hk
Set CA=--check-certificate=true
Set Proxy=--all-proxy=127.0.0.1:
Set /P Port=   请输入 HTTP/HTTPS 代理客户端的端口号：

:Download_Link
if not exist chrome-win32.zip.aria2 if exist chrome-win32.zip del chrome-win32.zip
if exist LAST_CHANGE del LAST_CHANGE
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o LAST_CHANGE --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/LAST_CHANGE
if not exist LAST_CHANGE echo.&echo    下载失败，按任意键返回。&pause >nul&goto Download
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
goto Finish

:Config
if not exist chrome-win32.zip  echo                      未发现 chrome-win32.zip，请返回菜单后按 1 下载。&echo.&echo.&echo.&echo.&echo                                         按任意键返回&pause>nul& goto Main
pause
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
7za_x86 x pepflashplayer.7z

:Shortcut
if not exist chrome-win32\chrome.exe  echo                      未发现 chrome-win32\chrome.exe，请返回菜单后按 2 配置。&echo.&echo.&echo.&echo.&echo                                         按任意键返回&pause>nul& goto Main
pause
start /min Create-Shortcut.bat
goto Finish

:Delete
if exist chrome-win32.zip del chrome-win32.zip
if exist chrome-win32.zip.aria2 del chrome-win32.zip.aria2
goto Finish

:Flash
Set CA=--check-certificate=true
rem Set Proxy=--all-proxy=127.0.0.1:
rem Set /P Port=   请输入 HTTP/HTTPS 代理客户端的端口号：
if not exist LAST_PepperFlash.aria2 if exist LAST_PepperFlash del LAST_PepperFlash
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -O https://github.com/xinhugo/Chromium-Download-Manager/raw/Beta/LAST_PepperFlash
if not exist LAST_PepperFlash echo.&echo    下载失败，按任意键返回。&pause >nul&goto Main
fc LAST_PepperFlash chrome-win32\LAST_PepperFlash &goto Shortcut
copy /y LAST_PepperFlash "chrome-win32\LAST_PepperFlash"
if not exist pepflashplayer.7z.aria2 if exist pepflashplayer.7z del pepflashplayer.7z
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -O https://github.com/xinhugo/Chromium-Download-Manager/raw/Beta/pepflashplayer.7z
if not exist pepflashplayer.7z goto Flash
if exist pepflashplayer.dll del /s /q pepflashplayer.dll
if exist Chromium-PPAPI-FLASH.bat del /s /q Chromium-PPAPI-FLASH.bat
if exist Chromium-PPAPI-FLASH.lnk del /s /q Chromium-PPAPI-FLASH.lnk
7za_x86 x pepflashplayer.7z
goto Shortcut

:Finish
echo.&echo    处理完成，按任意键返回。
pause >nul &goto Main