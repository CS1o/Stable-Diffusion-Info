@echo off
REM Check if venv directory exists
IF NOT EXIST "venv" (
    echo Creating virtual environment...
    python -m venv venv

    REM Activate the virtual environment
    echo Activating virtual environment...
    call venv\Scripts\activate

    REM Upgrade pip to the latest version
    echo Upgrading pip...
    python -m pip install --upgrade pip

    REM Install dependencies from requirements.txt
    IF EXIST "requirements.txt" (
        echo Installing dependencies from requirements.txt...
        pip install -r requirements.txt
    ) ELSE (
        echo requirements.txt not found. Skipping dependency installation.
    )

    REM Install torch, torchvision, and torchaudio with specific index URL
    echo Installing torch, torchvision, and torchaudio...
    pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

    REM Deactivate the virtual environment
    echo Deactivating virtual environment...
    deactivate
) ELSE (
    REM Activate the virtual environment
    echo Activating virtual environment...
    call venv\Scripts\activate
)

REM Run the main.py script
echo Running main.py...
python main.py

REM Deactivate the virtual environment
echo Deactivating virtual environment...
deactivate
