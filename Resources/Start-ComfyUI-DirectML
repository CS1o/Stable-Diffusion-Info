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

    REM Install torch-directml
    echo Installing torch-directml...
    pip install torch-directml
) ELSE (
    REM Activate the virtual environment
    echo Activating virtual environment...
    call venv\Scripts\activate
)

REM Run the main.py script with --auto-launch --directml argument
echo Running main.py with --auto-launch --directml argument...
python main.py --auto-launch --directml

REM Deactivate the virtual environment
echo Deactivating virtual environment...
deactivate
