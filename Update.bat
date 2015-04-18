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
if exist "Tools\7za_x86.exe" Set sza="Tools\7za_x86.exe"
if not exist %sza%  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    缺少 %sza%，请重新下载。&echo.&echo.&echo.&echo.&echo                                         按任意键退出&pause>nul& exit
if not exist "Tools\Create-Shortcut.bat" echo.&echo.&echo.&echo.&echo.&echo.&echo                             缺少 Tools\Create-Shortcut.bat，请重新下载。&echo.&echo.&echo.&echo.&echo                                         按任意键退出&pause>nul& exit
if not exist "Tools\Shortcut.exe" echo.&echo.&echo.&echo.&echo.&echo.&echo                             缺少 Tools\Shortcut.exe，请重新下载。&echo.&echo.&echo.&echo.&echo                                         按任意键退出&pause>nul& exit
if exist Tools\aria2.7z if exist Tools\aria2 rd /s /q Tools\aria2 &%sza% x -y Tools\aria2.7z
if exist Tools\aria2.7z %sza% x -y Tools\aria2.7z &del /q Tools\aria2.7z
if exist "Tools\aria2\aria2c.exe" Set aria2c="Tools\aria2\aria2c.exe" &goto Main
if exist "D:\软件库\绿色工具\网络工具\上传下载\aria2\x64\aria2c.exe" Set aria2c="D:\软件库\绿色工具\网络工具\上传下载\aria2\x64\aria2c.exe"
if not exist "Tools\aria2\aria2c.exe" if not exist "D:\软件库\绿色工具\网络工具\上传下载\aria2\x64\aria2c.exe"  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    缺少 aria2，请重新下载。&echo.&echo.&echo.&echo.&echo                                         按任意键退出&pause>nul& exit

:Main
if exist ps.vbs del ps.vbs
if exist Shortcut.7z del Shortcut.7z
cls
echo.
echo     即将 下载/配置 Chromium......
echo.&echo.
echo     1)下载：Chromium
echo     2)配置：解压缩、创建用户数据目录及快捷方式
echo     3)创建快捷方式（路径过长时，请用 Chromium.bat）
echo.
echo     4)更新：PPAPI-FLASH（pepflashplayer.dll）
echo     5)更新：ffmpegsumo（ffmpegsumo.dll）
echo.&echo.
echo     6)删除已下载的文件（避免不同文件错误地断点续传）
echo     7)删除 Chromium 缓存目录
echo.
echo.&echo.
echo     致谢及声明：
echo     1)在 phuslu 的 chromium 项目基础上改进；
echo     2)调用了32位的 7-Zip 命令行版本用于解压缩；
echo     3)7-Zip 发布于 GNU LGPL 协议，www.7-zip.org 的能够找到其源代码；
echo     4)调用了 aria2 从 HTTP 服务器下载数据。
echo.&echo.
echo     版本：2015/4/18；开发：Hugo。
echo.
echo ---------------------------------------------------------------------------
echo.
Set /P ST=   请输入数字：
echo. 
if /I "%ST%"=="1" goto Download
if /I "%ST%"=="2" goto Config
if /I "%ST%"=="3" goto Shortcut
if /I "%ST%"=="4" goto Flash
if /I "%ST%"=="5" goto ffmpegsumo
if /I "%ST%"=="6" goto Delete1
if /I "%ST%"=="7" goto Delete2
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
echo     6)返回主菜单
echo.&echo.
echo     致谢及声明：
echo     1)在 phuslu 的 chromium 项目基础上改进；
echo     2)调用了32位的 7-Zip 命令行版本用于解压缩；
echo     3)7-Zip 发布于 GNU LGPL 协议，www.7-zip.org 的能够找到其源代码；
echo     4)调用了 aria2 从 HTTP 服务器下载数据。
echo.&echo.
echo     版本：2015/4/18；开发：Hugo。
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
if exist LAST_CHANGE del LAST_CHANGE
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o LAST_CHANGE --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/LAST_CHANGE|Find /I "SSL/TLS handshake failure"
If "%ERRORLEVEL%"=="0" (Goto Download_Link)
if not exist LAST_CHANGE echo.&echo    下载失败，按任意键返回。&pause >nul&goto Download
(
    fc LAST_CHANGE Application\LAST_CHANGE
) && (
    echo Already Lastest Version ! && pause >nul&goto Main
) || (
    :Download_chrome-win32
	for /f %%I in (LAST_CHANGE) do (
	if not exist chrome-win32-%%I.zip.aria2 if exist chrome-win32-%%I.zip goto Test
    %aria2c% -c -s16 -x16 -k1m --remote-time=true %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o chrome-win32-%%I.zip --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/%%I/chrome-win32.zip
    )
) 
:Test
for /f %%I in (LAST_CHANGE) do (
	%sza% t 1chrome-win32-%%I.zip *.* -r |Find /I "一切正常"
	If "%ERRORLEVEL%"=="1" (del /q chrome-win32*.zip &goto Download_chrome-win32)
    )
goto Finish

:Config
echo for each ps in getobject("winmgmts://./root/cimv2:win32_process").instances_>ps.vbs 
echo wscript.echo ps.handle^&vbtab^&ps.name^&vbtab^&ps.executablepath>>ps.vbs 
echo next>>ps.vbs
cscript //nologo ps.vbs |Find /I "%~dp0"
If "%ERRORLEVEL%"=="0" (echo.&echo Chromium 正在运行，退出后才能配置它。&goto Finish)
for /f %%I in (LAST_CHANGE) do (
if not exist chrome-win32-%%I.zip  echo                      未发现 chrome-win32-%%I.zip，请返回菜单后按 1 下载。&echo.&echo.&echo.&echo.&echo                                         按任意键返回&pause>nul& goto Main
%sza% t chrome-win32-%%I.zip *.* -r |Find /I "错误"
If "%ERRORLEVEL%"=="0" (goto Finish)
if exist Old_Application rd /s /q Old_Application
if exist Application move /y Application Old_Application
%sza% x chrome-win32-%%I.zip
rename chrome-win32 Application
 ) && (
    move /y LAST_CHANGE "Application\LAST_CHANGE"
) && (
    rem if not exist "Application\plugins" (md "Application\plugins")
    rem for %%I in ("np*.dll") do (
    rem copy /y "%%~I" "Application\plugins\%%~nxI"
    )
) && (
    if not exist "%~dp0Data" (md "%~dp0Data")
) 
if exist PepFlashPlayer.7z %sza% x -y PepFlashPlayer.7z

:Shortcut
if not exist Application\chrome.exe  echo                      未发现 Application\chrome.exe，请返回菜单后按 2 配置。&echo.&echo.&echo.&echo.&echo                                         按任意键返回&pause>nul& goto Main
echo 网页缓存：%USERPROFILE%\ChromiumCache|Find /I " "
If "%ERRORLEVEL%"=="0" (goto Create-Shortcut_Blank.bat)
echo 用户数据：%cd%\Data|Find /I " "
If "%ERRORLEVEL%"=="0" (goto Create-Shortcut_Blank.bat)
goto Create-Shortcut.bat

:Create-Shortcut.bat
start /min Tools\Create-Shortcut.bat
goto Finish

:Create-Shortcut_Blank.bat
start /min Tools\Create-Shortcut_Blank.bat
goto Finish

:Flash
if exist Old_Application\LAST_PepperFlash copy /y Old_Application\LAST_PepperFlash Application
Set CA=--check-certificate=true
rem Set Proxy=--all-proxy=127.0.0.1:
rem Set /P Port=   请输入 HTTP/HTTPS 代理客户端的端口号：
if exist LAST_PepperFlash del LAST_PepperFlash
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o LAST_PepperFlash https://github.com/xinhugo/Chromium-Download-Manager/raw/Beta/LAST_PepperFlash
if not exist LAST_PepperFlash echo.&echo    下载失败，按任意键返回。&pause >nul&goto Main
(
    fc LAST_PepperFlash Application\LAST_PepperFlash 
) && (
    echo Already Lastest Version ! && pause >nul&goto Main
) || (
    if not exist PepFlashPlayer.7z.aria2 if exist PepFlashPlayer.7z del PepFlashPlayer.7z
    %aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o PepFlashPlayer.7z https://raw.githubusercontent.com/xinhugo/Chromium-Download-Manager/Beta/PepFlashPlayer.7z
    if not exist PepFlashPlayer.7z goto Flash
    %sza% x -y PepFlashPlayer.7z
	del PepFlashPlayer.7z
    move /y LAST_PepperFlash "Application\LAST_PepperFlash"
	:Shortcut.7z
	%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o Shortcut.7z https://raw.githubusercontent.com/xinhugo/Chromium-Download-Manager/Beta/Shortcut.7z
	if not exist Shortcut.7z goto Shortcut.7z
	%sza% x -y Shortcut.7z Chromium.bat  -r
	%sza% x -y Shortcut.7z -oTools Create-Shortcut.bat -r
	%sza% x -y Shortcut.7z -oTools Create-Shortcut_Blank.bat -r
    del Shortcut.7z
	goto Shortcut
) 

:ffmpegsumo
echo for each ps in getobject("winmgmts://./root/cimv2:win32_process").instances_>ps.vbs 
echo wscript.echo ps.handle^&vbtab^&ps.name^&vbtab^&ps.executablepath>>ps.vbs 
echo next>>ps.vbs
cscript //nologo ps.vbs |Find /I "%~dp0"
If "%ERRORLEVEL%"=="0" (echo.&echo Chromium 正在运行，退出后才能配置它。&goto Finish)
if exist Old_Application\LAST_ffmpegsumo copy /y Old_Application\LAST_ffmpegsumo Application
if exist Old_Application\LAST_ffmpegsumo copy /y Old_Application\ffmpegsumo.dll Application
if exist ffmpegsumo.7z %sza% x -y ffmpegsumo.7z -oApplication
if exist ffmpegsumo.7z del ffmpegsumo.7z
if exist ffmpegsumo.7z move /y LAST_ffmpegsumo "Application\LAST_ffmpegsumo"
Set CA=--check-certificate=true
rem Set Proxy=--all-proxy=127.0.0.1:
rem Set /P Port=   请输入 HTTP/HTTPS 代理客户端的端口号：
if exist LAST_ffmpegsumo del LAST_ffmpegsumo
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o LAST_ffmpegsumo https://github.com/xinhugo/Chromium-Download-Manager/raw/Beta/LAST_ffmpegsumo
if not exist LAST_ffmpegsumo goto ffmpegsumo
(
    fc LAST_ffmpegsumo Application\LAST_ffmpegsumo 
) && (
    echo Already Lastest Version ! &del ps.vbs&del LAST_ffmpegsumo& pause >nul&goto Main
) || (
    ::Download_ffmpegsumo
    if not exist ffmpegsumo.7z.aria2 if exist ffmpegsumo.7z del ffmpegsumo.7z
    %aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o ffmpegsumo.7z https://raw.githubusercontent.com/xinhugo/Chromium-Download-Manager/Beta/ffmpegsumo.7z
    if not exist ffmpegsumo.7z goto Download_ffmpegsumo
    %sza% x -y ffmpegsumo.7z -oApplication
	del ffmpegsumo.7z
    move /y LAST_ffmpegsumo "Application\LAST_ffmpegsumo"
) 
goto Finish

:Delete1
if exist chrome-win32*.zip del chrome-win32*.zip
if exist chrome-win32*.zip.aria2 del chrome-win32*.zip.aria2
if exist PepFlashPlayer.7z del PepFlashPlayer.7z
if exist PepFlashPlayer.7z.aria2 del PepFlashPlayer.7z.aria2
goto Finish

:Delete2
if exist %USERPROFILE%\ChromiumCache rd /s /q %USERPROFILE%\ChromiumCache

:Finish
if exist ps.vbs del ps.vbs
echo.&echo    处理完成，按任意键返回。
pause >nul &goto Main