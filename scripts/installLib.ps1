Write-Host "=== Setup ambiente virtuale Python ==="

# 1. Crea .venv se non esiste
if (!(Test-Path ".\.venv")) {
    Write-Host "Nessun ambiente virtuale trovato. Creazione in corso..."
    python -m venv .venv
}

# 2. Sblocca temporaneamente l'esecuzione di script in PowerShell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# 3. Attiva il venv
Write-Host "Attivazione dell'ambiente virtuale..."
. .\.venv\Scripts\Activate.ps1

# 4. Aggiorna pip
Write-Host "Aggiornamento di pip..."
python -m pip install --upgrade pip

# 5. Installa pacchetti
if (Test-Path ".\requirements.txt") {
    Write-Host "Trovato file requirements.txt - installazione pacchetti..."
    pip install -r requirements.txt
}
else {
    Write-Host "Nessun requirements.txt trovato. Installo librerie base..."
    $packages = @(
        "numpy",
        "matplotlib",
        "scipy",
        "pandas",
        "seaborn"
    )

    foreach ($pkg in $packages) {
        Write-Host "Installazione di $pkg..."
        pip install $pkg
    }
}

# 6. Genera/aggiorna requirements.txt
Write-Host "Aggiornamento del file requirements.txt..."
pip freeze | Out-File -Encoding UTF8 -FilePath "requirements.txt"

Write-Host ""
Write-Host "Setup completato!"
Write-Host ("Ambiente attivo: " + (python --version))
Write-Host "Librerie salvate in requirements.txt"
