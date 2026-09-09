@echo off
chcp 936 >nul
title GoldLogic OA 一键安装
set ROOT=%~dp0
set ENV=%ROOT%oa-env
echo ============================================
echo   GoldLogic OA 一键安装脚本
echo   目标布局: %ENV%
echo ============================================
echo.

if exist "%ENV%\php\php.exe" (
    echo [OK] PHP 已安装, 跳过
    goto mariadb
)

echo [1/3] 正在下载 PHP 8.2 NTS 便携版 (约30MB)...
if not exist "%ENV%" mkdir "%ENV%"
powershell -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://windows.php.net/downloads/releases/archives/php-8.2.29-nts-Win32-vs16-x64.zip' -OutFile '%ENV%\php.zip'"
if errorlevel 1 (
    echo [错误] PHP 下载失败, 请手动下载:
    echo   https://windows.php.net/downloads/releases/archives/php-8.2.29-nts-Win32-vs16-x64.zip
    echo   解压到 %ENV%\php 后重新运行本脚本
    pause & exit /b 1
)
powershell -Command "$ProgressPreference='SilentlyContinue'; Expand-Archive -Path '%ENV%\php.zip' -DestinationPath '%ENV%\php' -Force"
del "%ENV%\php.zip"
copy /Y "%ROOT%env\php.ini" "%ENV%\php\php.ini" >nul
echo [OK] PHP 就绪 (含 php.ini, 扩展已配好)

:mariadb
if exist "%ENV%\mariadb\mariadb-10.11.10-winx64\bin\mysqld.exe" (
    echo [OK] MariaDB 已安装, 跳过
    goto fonts
)
echo [2/3] 正在下载 MariaDB 10.11.10 (约70MB)...
powershell -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://archive.mariadb.org/mariadb-10.11.10/winx64-packages/mariadb-10.11.10-winx64.zip' -OutFile '%ENV%\mariadb.zip'"
if errorlevel 1 (
    echo [错误] MariaDB 下载失败, 请手动下载:
    echo   https://archive.mariadb.org/mariadb-10.11.10/winx64-packages/mariadb-10.11.10-winx64.zip
    echo   解压到 %ENV%\mariadb 后重新运行本脚本
    pause & exit /b 1
)
if not exist "%ENV%\mariadb" mkdir "%ENV%\mariadb"
powershell -Command "$ProgressPreference='SilentlyContinue'; Expand-Archive -Path '%ENV%\mariadb.zip' -DestinationPath '%ENV%\mariadb' -Force"
del "%ENV%\mariadb.zip"
echo [OK] MariaDB 就绪

:fonts
echo [3/3] 布置字体、配置与 nginx...
if not exist "%ENV%\fonts" mkdir "%ENV%\fonts"
copy /Y "%ROOT%env\fonts\*.ttf" "%ENV%\fonts\" >nul
if not exist "%ENV%\mariadb\my.ini" copy /Y "%ROOT%env\my.ini" "%ENV%\mariadb\my.ini" >nul
if not exist "%ENV%\nginx-1.26.3" (
    xcopy /E /I /Y "%ROOT%env\nginx-1.26.3" "%ENV%\nginx-1.26.3" >nul
)
echo.
echo ============================================
echo   安装完成! 下一步:
echo   1. 双击 启动OA.bat  (会自动初始化数据库)
echo   2. 浏览器访问 http://127.0.0.1:8010
echo   详见 台式机部署指南.md
echo ============================================
pause