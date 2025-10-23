# Configuration
This project requires Python 3.8 or higher.
It is recommended to use a virtual environment to manage dependencies.
To set up the environment, run the provided installation script located in the `scripts` directory:

## For Windows PowerShell
```powershell
.\scripts\installLib.ps1
```

## For Unix-based systems (Linux, macOS)
```bash
./scripts/installLib.sh
```
> This script is not tested so it's not guaranteed to work.

The script will create a virtual environment (if it doesn't exist), install the required libraries, and generate an updated `requirements.txt` file.