@echo off
chcp 65001 >nul
echo ====================================
echo    启动 Hugo 本地开发服务器
echo ====================================
echo.
echo 正在启动服务器...
echo 服务器启动后访问: http://localhost:1313
echo.
echo 按 Ctrl+C 停止服务器
echo ====================================
echo.

cd /d "%~dp0"
hugo server -D --bind 0.0.0.0 --baseURL http://localhost:1313

pause
