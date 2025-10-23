#!/usr/bin/bash
# ================================================================
# Attiva o crea un ambiente virtuale Python, installa librerie mancanti
# e genera automaticamente un file requirements.txt aggiornato.
# ================================================================

echo "=== Setup ambiente virtuale Python ==="

# 1. Crea .venv se non esiste
if [ ! -d ".venv" ]; then
    echo "Nessun ambiente virtuale trovato. Creazione in corso..."
    python3 -m venv .venv
fi

# 2. Attiva l'ambiente virtuale
echo "Attivazione dell'ambiente virtuale..."
source .venv/bin/activate

# 3. Aggiorna pip
echo "Aggiornamento di pip..."
python -m pip install --upgrade pip

# 4. Installa pacchetti
if [ -f "requirements.txt" ]; then
    echo "Trovato file requirements.txt - installazione pacchetti..."
    pip install -r requirements.txt
else
    echo "Nessun requirements.txt trovato. Installo librerie base..."
    packages=(
        numpy
        matplotlib
        scipy
        pandas
    )
    for pkg in "${packages[@]}"; do
        echo "Installazione di $pkg..."
        pip install "$pkg"
    done
fi

# 5. Genera/aggiorna requirements.txt
echo "Aggiornamento del file requirements.txt..."
pip freeze > requirements.txt

echo ""
echo "Setup completato!"
echo "Ambiente attivo: $(python --version)"
echo "Librerie salvate in requirements.txt"
