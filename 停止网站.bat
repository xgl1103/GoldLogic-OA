@echo off
chcp 65001 >nul
title GoldLogic OA 停止网站
cd /d "%~dp0"

echo 检查 Docker 是否在运行...
docker info >nul 2>&1
if errorlevel 1 (
    echo Docker 未在运行，无需停止。
    timeout /t 3 >nul
    exit /b 0
)

echo 停止网站容器（数据已保留）...
docker compose down

echo.
echo 网站已停止。
timeout /t 3 >nul