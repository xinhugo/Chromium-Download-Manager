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
Echo ��Ǹ��ȡϵͳ�汾������ȷ�����ϵͳ�Ƿ�ΪWindows XP/2003/Vista/2008/7/2008 R2/8/8.1����������˳���
Pause>nul
exit

:Files check
if exist "Tools\7za_x86.exe" Set sza="Tools\7za_x86.exe"
if not exist %sza%  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    ȱ�� %sza%�����������ء�&echo.&echo.&echo.&echo.&echo                                         ��������˳�&pause>nul& exit
if not exist "Tools\Create-Shortcut.bat" echo.&echo.&echo.&echo.&echo.&echo.&echo                             ȱ�� Tools\Create-Shortcut.bat�����������ء�&echo.&echo.&echo.&echo.&echo                                         ��������˳�&pause>nul& exit
if not exist "Tools\Shortcut.exe" echo.&echo.&echo.&echo.&echo.&echo.&echo                             ȱ�� Tools\Shortcut.exe�����������ء�&echo.&echo.&echo.&echo.&echo                                         ��������˳�&pause>nul& exit
if exist Tools\aria2.7z if exist Tools\aria2 rd /s /q Tools\aria2 &%sza% x -y Tools\aria2.7z
if exist Tools\aria2.7z %sza% x -y Tools\aria2.7z &del /q Tools\aria2.7z
if exist "Tools\aria2\aria2c.exe" Set aria2c="Tools\aria2\aria2c.exe" &goto Main
if exist "D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe" Set aria2c="D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe"
if not exist "Tools\aria2\aria2c.exe" if not exist "D:\�����\��ɫ����\���繤��\�ϴ�����\aria2\x64\aria2c.exe"  echo.&echo.&echo.&echo.&echo.&echo.&echo                                    ȱ�� aria2�����������ء�&echo.&echo.&echo.&echo.&echo                                         ��������˳�&pause>nul& exit

:Main
if exist ps.vbs del ps.vbs
if exist Shortcut.7z del Shortcut.7z
cls
echo.
echo     ���� ����/���� Chromium......
echo.&echo.
echo     1)���أ�Chromium
echo     2)���ã���ѹ���������û�����Ŀ¼����ݷ�ʽ
echo     3)������ݷ�ʽ��·������ʱ������ Chromium.bat��
echo.
echo     4)���£�PPAPI-FLASH��pepflashplayer.dll��
echo     5)���£�ffmpegsumo��ffmpegsumo.dll��
echo.&echo.
echo     6)ɾ���ɵ� Chromium ѹ���������������һ���汾��
echo     7)ɾ�� Chromium ����Ŀ¼
echo.
echo.&echo.
echo     ��л��������
echo     1)�� phuslu �� chromium ��Ŀ�����ϸĽ���
echo     2)������32λ�� 7-Zip �����а汾���ڽ�ѹ����
echo     3)7-Zip ������ GNU LGPL Э�飬www.7-zip.org ���ܹ��ҵ���Դ���룻
echo     4)������ aria2 �� HTTP �������������ݡ�
echo.&echo.
echo     �汾��2015/6/12��������Hugo��
echo.
echo ---------------------------------------------------------------------------
echo.
Set /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Download
if /I "%ST%"=="2" goto Config
if /I "%ST%"=="3" goto Shortcut
if /I "%ST%"=="4" goto Flash
if /I "%ST%"=="5" goto ffmpegsumo
if /I "%ST%"=="6" goto Delete1
if /I "%ST%"=="7" goto Delete2
echo    ��Чѡ�񣬰���������أ�
pause >nul
goto Main

:Download
cls
echo.
echo     ���� ���� Chromium......
echo.&echo. 
echo     ������ %aria2c% ���ء�
echo.&echo. 
echo     1)ֱ�����أ�www.google.co.jp��
echo.
echo     2)ֱ�����أ�www.google.com.hk��
echo     3)ֱ�����أ�dl.google.com��
echo.&echo. 
echo     4)�Զ�����������أ�IP ��ַ/������
echo     5)�������أ������� HTTP/HTTPS ���ش���ͻ��ˣ�
echo.&echo. 
echo     6)����ָ���汾
echo.
echo     7)�������˵�
echo.&echo.
echo     ��л��������
echo     1)�� phuslu �� chromium ��Ŀ�����ϸĽ���
echo     2)������32λ�� 7-Zip �����а汾���ڽ�ѹ����
echo     3)7-Zip ������ GNU LGPL Э�飬www.7-zip.org ���ܹ��ҵ���Դ���룻
echo     4)������ aria2 �� HTTP �������������ݡ�
echo.&echo.
echo     �汾��2015/6/12��������Hugo��
echo.
echo ---------------------------------------------------------------------------
echo.
Set /P ST=   ���������֣�
echo. 
if /I "%ST%"=="1" goto Download_Direct_1
if /I "%ST%"=="2" goto Download_Direct_2
if /I "%ST%"=="3" goto Download_Direct_3
if /I "%ST%"=="4" goto Download_Custom
if /I "%ST%"=="5" goto Download_Proxy
if /I "%ST%"=="6" goto Download_Ver
if /I "%ST%"=="7" goto Main
echo    ��Чѡ�񣬰���������أ�
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
Set /P Server=   ������ IP ��ַ/������
Set CA=--check-certificate=false
goto Download_Link

:Download_Proxy
Set Server=www.google.co.jp
Set CA=--check-certificate=true
Set Proxy=--all-proxy=127.0.0.1:
Set /P Port=   ������ HTTP/HTTPS ����ͻ��˵Ķ˿ںţ�

:Download_Ver
Set /P Ver=   �������޶��汾�ţ�
echo %Ver% >>LAST_CHANGE
Set Server=www.google.co.jp
Set CA=--check-certificate=true
goto Download_chrome-win32

:Download_Link
if exist LAST_CHANGE del LAST_CHANGE
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o LAST_CHANGE --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/LAST_CHANGE|Find /I "SSL/TLS handshake failure"
If "%ERRORLEVEL%"=="0" (Goto Download_Link)
if not exist LAST_CHANGE echo.&echo    ����ʧ�ܣ�����������ء�&pause >nul&goto Download
(
    fc LAST_CHANGE Application\LAST_CHANGE
) && (
    echo Already Lastest Version ! &del LAST_CHANGE&pause >nul&goto Main
) || (
    :Download_chrome-win32
	for /f %%I in (LAST_CHANGE) do (
	if not exist chrome-win32-%%I.zip.aria2 if exist chrome-win32-%%I.zip goto Test
    %aria2c% -c -s16 -x16 -k1m --remote-time=true %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o chrome-win32-%%I.zip --header=Host:commondatastorage.googleapis.com https://%Server%/chromium-browser-snapshots/Win/%%I/chrome-win32.zip
    )
) 
:Test
for /f %%I in (LAST_CHANGE) do (
	%sza% t 1chrome-win32-%%I.zip *.* -r |Find /I "һ������"
	If "%ERRORLEVEL%"=="1" (del /q chrome-win32*.zip &goto Download_chrome-win32)
    )
goto Finish

:Config
echo for each ps in getobject("winmgmts://./root/cimv2:win32_process").instances_>ps.vbs 
echo wscript.echo ps.handle^&vbtab^&ps.name^&vbtab^&ps.executablepath>>ps.vbs 
echo next>>ps.vbs
cscript //nologo ps.vbs |Find /I "%~dp0"
If "%ERRORLEVEL%"=="0" (echo.&echo Chromium �������У��˳��������������&goto Finish)
for /f %%I in (LAST_CHANGE) do (
if not exist chrome-win32-%%I.zip  echo                      δ���� chrome-win32-%%I.zip���뷵�ز˵��� 1 ���ء�&echo.&echo.&echo.&echo.&echo                                         �����������&pause>nul& goto Main
%sza% t chrome-win32-%%I.zip *.* -r |Find /I "����"
If "%ERRORLEVEL%"=="0" (goto Finish)
if exist Application rd /s /q Application
if exist chrome-win32 rd /s /q chrome-win32
%sza% x chrome-win32-%%I.zip
ping 127.0.0.1 -n 3 >nul
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
if not exist Application\chrome.exe  echo                      δ���� Application\chrome.exe���뷵�ز˵��� 2 ���á�&echo.&echo.&echo.&echo.&echo                                         �����������&pause>nul& goto Main
echo ��ҳ���棺%USERPROFILE%\ChromiumCache|Find /I " "
If "%ERRORLEVEL%"=="0" (goto Create-Shortcut_Blank.bat)
echo �û����ݣ�%cd%\Data|Find /I " "
If "%ERRORLEVEL%"=="0" (goto Create-Shortcut_Blank.bat)
goto Create-Shortcut.bat

:Create-Shortcut.bat
start /min Tools\Create-Shortcut.bat
goto Finish

:Create-Shortcut_Blank.bat
start /min Tools\Create-Shortcut_Blank.bat
goto Finish

:Flash
Set CA=--check-certificate=true
rem Set Proxy=--all-proxy=127.0.0.1:
rem Set /P Port=   ������ HTTP/HTTPS ����ͻ��˵Ķ˿ںţ�
if exist LAST_PepperFlash del LAST_PepperFlash
%aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o LAST_PepperFlash https://github.com/xinhugo/Chromium-Download-Manager/raw/Beta/LAST_PepperFlash
if not exist LAST_PepperFlash echo.&echo    ����ʧ�ܣ�����������ء�&pause >nul&goto Main
(
    fc LAST_PepperFlash Plugins\LAST_PepperFlash
) && (
    echo Already Lastest Version ! &del LAST_PepperFlash& pause >nul&goto Main
) || (
    if not exist PepFlashPlayer.7z.aria2 if exist PepFlashPlayer.7z del PepFlashPlayer.7z
    %aria2c% -c -s16 -x16 -k1m --remote-time=true --connect-timeout=30 %CA% --enable-mmap --file-allocation=falloc --disk-cache=64M %Proxy%%Port% -o PepFlashPlayer.7z https://raw.githubusercontent.com/xinhugo/Chromium-Download-Manager/Beta/PepFlashPlayer.7z
    if not exist PepFlashPlayer.7z goto Flash
    %sza% x -y PepFlashPlayer.7z
	del PepFlashPlayer.7z
    move /y LAST_PepperFlash "Plugins\LAST_PepperFlash"
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
If "%ERRORLEVEL%"=="0" (echo.&echo Chromium �������У��˳��������������&goto Finish)
if exist Plugins\LAST_ffmpegsumo copy /y Plugins\LAST_ffmpegsumo Application
if exist Plugins\LAST_ffmpegsumo copy /y Plugins\ffmpegsumo.dll Application
if exist ffmpegsumo.7z %sza% x -y ffmpegsumo.7z -oPlugins
if exist ffmpegsumo.7z copy /y Plugins\ffmpegsumo.dll Application
if exist ffmpegsumo.7z del ffmpegsumo.7z
if exist ffmpegsumo.7z move /y LAST_ffmpegsumo "Plugins\LAST_ffmpegsumo"
Set CA=--check-certificate=true
rem Set Proxy=--all-proxy=127.0.0.1:
rem Set /P Port=   ������ HTTP/HTTPS ����ͻ��˵Ķ˿ںţ�
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
    if exist ffmpegsumo.7z %sza% x -y ffmpegsumo.7z -oPlugins
    if exist ffmpegsumo.7z copy /y Plugins\ffmpegsumo.dll Application
	del ffmpegsumo.7z
    move /y LAST_ffmpegsumo "Plugins\LAST_ffmpegsumo"
) 
goto Finish

:Delete1
if exist Application\LAST_CHANGE for /f %%I in (Application\LAST_CHANGE) do (
	if not exist Temp md Temp
	if exist chrome-win32-%%I.zip move chrome-win32-%%I.zip Temp
    if exist chrome-win32*.zip del chrome-win32*.zip
	if exist Temp\chrome-win32-%%I.zip move Temp\chrome-win32-%%I.zip
	rd Temp
    )
goto Finish

:Delete2
if exist %USERPROFILE%\ChromiumCache rd /s /q %USERPROFILE%\ChromiumCache

:Finish
if exist ps.vbs del ps.vbs
echo.&echo    ������ɣ�����������ء�
pause >nul &goto Main