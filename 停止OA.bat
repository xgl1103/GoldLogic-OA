@echo off
chcp 936 >nul
title GoldLogic OA 停止
echo 停止 Web 服务...
cd /d "C:\Code\oa-env\nginx-1.26.3"
nginx.exe -s stop >nul 2>&1
taskkill /f /im php-cgi.exe >nul 2>&1
echo 停止 MariaDB...
taskkill /f /im mysqld.exe >nul 2>&1
echo.
echo 全部服务已停止
timeout /t 3 >nul
