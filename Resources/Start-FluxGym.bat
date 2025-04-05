@echo off
REM Check if virtual environment exists
IF NOT EXIST "venv\" (
    echo Creating virtual environment...
    python -m venv venv

    echo Activating virtual environment...
    call venv\Scripts\activate

    echo Installing requirements in sd-scripts...
    cd sd-scripts
    pip install -r requirements.txt

    echo Installing root requirements...
    cd ..
    pip install -r requirements.txt

    echo Installing specific PyTorch version...
    pip install torch==2.3.1 torchvision --index-url https://download.pytorch.org/whl/cu118
) ELSE (
    echo Virtual environment already exists. Skipping setup...
    call venv\Scripts\activate
)

REM Launch the application
echo Launching FluxGym...
echo (If you dont see the UI, reload the Browserpage)
start "" /B python app.py

REM Wait a bit then open browser
timeout /t 10 >nul
start http://127.0.0.1:7860
