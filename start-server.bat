@echo off
setlocal
set SCRIPT_DIR=%~dp0

echo.
echo  ========================================
echo   🚀 Velocity Courier - Starting...
echo  ========================================
echo.

:: Start backend
cd /d "%SCRIPT_DIR%backend"
if not exist "node_modules" (
    echo [Backend] Installing dependencies...
    call npm install
)
echo [Backend] Starting server on port 5000...
start cmd /k "title Velocity Courier - Backend && npm run dev"

:: Small delay to let backend start first
timeout /t 2 /nobreak >nul

:: Start frontend
cd /d "%SCRIPT_DIR%frontend"
if not exist "node_modules" (
    echo [Frontend] Installing dependencies...
    call npm install
)
echo [Frontend] Starting dev server on port 5173...
start cmd /k "title Velocity Courier - Frontend && npm run dev"

echo.
echo  ========================================
echo   ✅ Both servers are starting!
echo  ----------------------------------------
echo   Backend:  http://localhost:5000
echo   Frontend: http://localhost:5173
echo  ========================================
echo.

endlocal
