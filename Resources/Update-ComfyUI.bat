@echo off
REM ==========================================
REM ComfyUI Update Script
REM - git pull
REM - activate venv
REM - upgrade pip
REM - update requirements
REM ==========================================

REM Git Update
echo === Git pull ===
git pull

REM Activate venv
echo === Activate venv ===
call venv\Scripts\activate.bat

REM Upgrade Pip
echo === Upgrade pip ===
python -m pip install --upgrade pip

REM Update Requirements
echo === Install requirements ===
pip install -r requirements.txt --upgrade
python -m pip install -r manager_requirements.txt --upgrade

echo.
echo === Done ===
pause
