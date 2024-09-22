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
    pip install torch==2.3.1 torchvision==0.18.1 torchaudio==2.3.1 --index-url https://download.pytorch.org/whl/cu118
) ELSE (
    REM Activate the virtual environment
    echo Activating virtual environment...
    call venv\Scripts\activate
)

REM Run the main.py script with --auto-launch argument
echo Running main.py with --auto-launch argument...
python main.py --auto-launch

REM Deactivate the virtual environment
echo Deactivating virtual environment...
deactivate
