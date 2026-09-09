@echo off
chcp 936 >nul
title GoldLogic OA 启动
set ENV=%~dp0oa-env
echo ============================================
echo   GoldLogic OA 启动脚本
echo ============================================

REM ---------- 1. 数据库 ----------
netstat -ano | findstr ":3307 " | findstr "LISTENING" >nul
if errorlevel 1 (
    echo [1/3] 启动 MariaDB...
    if not exist "%ENV%\mariadb\data\mysql" (
        echo   首次运行: 初始化数据库...
        "%ENV%\mariadb\mariadb-10.11.10-winx64\bin\mariadb-install-db.exe" --datadir="%ENV%\mariadb\data" --auth-root-authentication-method=normal >nul 2>&1
    )
    start "MariaDB" /min "%ENV%\mariadb\mariadb-10.11.10-winx64\bin\mysqld.exe" --defaults-file="%ENV%\mariadb\my.ini" --console
    echo   等待数据库就绪...
    timeout /t 6 /nobreak >nul
) else (
    echo [1/3] MariaDB 已在运行, 跳过
)

REM ---------- 2. 首次导入数据库 ----------
"%ENV%\mariadb\mariadb-10.11.10-winx64\bin\mysql.exe" --port=3307 -h127.0.0.1 -uroot -proot123456 -e "use gouguoa" >nul 2>&1
if errorlevel 1 (
    echo   首次运行: 导入数据库 (约半分钟)...
    "%ENV%\mariadb\mariadb-10.11.10-winx64\bin\mysql.exe" --port=3307 -h127.0.0.1 -uroot -proot123456 -e "CREATE DATABASE IF NOT EXISTS gouguoa DEFAULT CHARACTER SET utf8mb4"
    "%ENV%\mariadb\mariadb-10.11.10-winx64\bin\mysql.exe" --port=3307 -h127.0.0.1 -uroot -proot123456 --default-character-set=utf8mb4 gouguoa < "%~dp0db_seed_goldlogic.sql"
    echo   数据库导入完成
) else (
    echo [2/3] 数据库 gouguoa 已存在, 跳过导入
)

REM ---------- 3. Web 服务 ----------
netstat -ano | findstr ":8010 " | findstr "LISTENING" >nul
if errorlevel 1 (
    echo [3/3] 启动 php-cgi x3 + nginx...
    cd /d "%ENV%\php"
    start "php-cgi-1" /min php-cgi.exe -b 127.0.0.1:9001
    start "php-cgi-2" /min php-cgi.exe -b 127.0.0.1:9002
    start "php-cgi-3" /min php-cgi.exe -b 127.0.0.1:9003
    timeout /t 2 /nobreak >nul
    cd /d "%ENV%\nginx-1.26.3"
    start "nginx" /min nginx.exe -p "%ENV%\nginx-1.26.3\"
    timeout /t 2 /nobreak >nul
    start http://127.0.0.1:8010/home/login/index.html
    echo [OK] 服务已启动, 浏览器将自动打开
) else (
    echo [3/3] Web 服务已在运行, 跳过
    start http://127.0.0.1:8010/home/login/index.html
)

echo.
echo 完成! 账号 admin / GoldLogic@2026
timeout /t 5 >nul