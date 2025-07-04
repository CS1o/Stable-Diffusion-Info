@echo off
REM Start-FluxGym.bat

REM Set working directory to the script's location
cd /d %~dp0

REM Check if virtual environment exists
IF NOT EXIST "env\" (
    echo Creating virtual environment...
    python -m venv env
)

REM Activate virtual environment
call env\Scripts\activate

REM Install dependencies for sd-scripts
IF EXIST "sd-scripts\requirements.txt" (
    echo Installing sd-scripts dependencies...
    cd sd-scripts
    pip install -r requirements.txt
    cd ..
) ELSE (
    echo ERROR: sd-scripts directory or requirements.txt not found.
    exit /b 1
)

REM Install FluxGym dependencies
echo Installing FluxGym app dependencies...
pip install -r requirements.txt

REM Install specific PyTorch version 2.3.1 (CUDA 12.1)
echo Installing PyTorch 2.3.1 (CUDA 12.1)...
pip install torch==2.3.1 torchvision==0.14.1 torchaudio==2.3.1 --index-url https://download.pytorch.org/whl/cu121

REM Uncomment below if you need the RTX 50xx (CUDA 12.8) version instead
REM echo Installing PyTorch 2.7.0 (CUDA 12.8) for RTX 50xx GPUs...
REM pip install torch==2.7.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128 && pip install -U bitsandbytes

REM Launch the application
echo Launching FluxGym...
echo (If you dont see the UI, reload the Browserpage)
start "" /B python app.py

REM Wait a bit then open browser
timeout /t 10 >nul
start http://127.0.0.1:7860
