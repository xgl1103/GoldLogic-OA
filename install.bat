@echo off
chcp 936 >nul
title GoldLogic OA 一键安装
echo ============================================
echo   GoldLogic OA 一键安装脚本
echo   目标布局: C:\Code\oa-env  (固定路径, 勿改)
echo ============================================
echo.

if exist "C:\Code\oa-env\php\php.exe" (
    echo [OK] PHP 已安装, 跳过
    goto mariadb
)

echo [1/3] 正在下载 PHP 8.2 NTS 便携版 (约30MB)...
if not exist "C:\Code\oa-env" mkdir "C:\Code\oa-env"
powershell -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://windows.php.net/downloads/releases/archives/php-8.2.29-nts-Win32-vs16-x64.zip' -OutFile 'C:\Code\oa-env\php.zip'"
if errorlevel 1 (
    echo [错误] PHP 下载失败, 请手动下载:
    echo   https://windows.php.net/downloads/releases/archives/php-8.2.29-nts-Win32-vs16-x64.zip
    echo   解压到 C:\Code\oa-env\php 后重新运行本脚本
    pause & exit /b 1
)
powershell -Command "$ProgressPreference='SilentlyContinue'; Expand-Archive -Path 'C:\Code\oa-env\php.zip' -DestinationPath 'C:\Code\oa-env\php' -Force"
del "C:\Code\oa-env\php.zip"
copy /Y "%~dp0env\php.ini" "C:\Code\oa-env\php\php.ini" >nul
echo [OK] PHP 就绪 (含 php.ini, 扩展已配好)

:mariadb
if exist "C:\Code\oa-env\mariadb\mariadb-10.11.10-winx64\bin\mysqld.exe" (
    echo [OK] MariaDB 已安装, 跳过
    goto fonts
)
echo [2/3] 正在下载 MariaDB 10.11.10 (约70MB)...
powershell -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://archive.mariadb.org/mariadb-10.11.10/winx64-packages/mariadb-10.11.10-winx64.zip' -OutFile 'C:\Code\oa-env\mariadb.zip'"
if errorlevel 1 (
    echo [错误] MariaDB 下载失败, 请手动下载:
    echo   https://archive.mariadb.org/mariadb-10.11.10/winx64-packages/mariadb-10.11.10-winx64.zip
    echo   解压到 C:\Code\oa-env\mariadb 后重新运行本脚本
    pause & exit /b 1
)
if not exist "C:\Code\oa-env\mariadb" mkdir "C:\Code\oa-env\mariadb"
powershell -Command "$ProgressPreference='SilentlyContinue'; Expand-Archive -Path 'C:\Code\oa-env\mariadb.zip' -DestinationPath 'C:\Code\oa-env\mariadb' -Force"
del "C:\Code\oa-env\mariadb.zip"
echo [OK] MariaDB 就绪

:fonts
echo [3/3] 布置字体、配置与 nginx...
if not exist "C:\Code\oa-env\fonts" mkdir "C:\Code\oa-env\fonts"
copy /Y "%~dp0env\fonts\*.ttf" "C:\Code\oa-env\fonts\" >nul
copy /Y "%~dp0env\my.ini" "C:\Code\oa-env\mariadb\my.ini" >nul
if not exist "C:\Code\oa-env\nginx-1.26.3" (
    xcopy /E /I /Y "%~dp0env\nginx-1.26.3" "C:\Code\oa-env\nginx-1.26.3" >nul
)
echo.
echo ============================================
echo   安装完成! 下一步:
echo   1. 双击 启动OA.bat  (会自动初始化数据库)
echo   2. 浏览器访问 http://127.0.0.1:8010
echo   详见 台式机部署指南.md
echo ============================================
pause
