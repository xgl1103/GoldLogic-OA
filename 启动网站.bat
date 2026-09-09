@echo off
chcp 65001 >nul
title GoldLogic OA 启动网站
cd /d "%~dp0"

echo ============================================
echo   GoldLogic OA 一键启动
echo ============================================

echo 检查 Docker 是否在运行...
docker info >nul 2>&1
if errorlevel 1 (
    echo Docker 引擎未就绪，正在打开 Docker Desktop，请稍等...
    start "" "D:\Docker\Docker Desktop.exe"
)

echo 等待 Docker 引擎就绪（最多 2 分钟）...
set /a cnt=120
:wait
docker info >nul 2>&1
if not errorlevel 1 goto ok
timeout /t 1 /nobreak >nul
set /a cnt-=1
if %cnt% GTR 0 goto wait
echo 等待超时：请确认 Docker Desktop 已正常启动后，再双击本脚本重试。
pause
exit /b 1

:ok
echo 启动网站容器...
docker compose up -d
timeout /t 3 /nobreak >nul
start http://127.0.0.1:8010/home/login/index.html
echo.
echo 完成! 账号 admin / 密码 GoldLogic@2026
timeout /t 6 >nul