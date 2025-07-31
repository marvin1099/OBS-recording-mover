#!/usr/bin/env bash

folder="$(dirname "$0")"
venv="$folder/venv"

# Create virtual environment if it doesn't exist
if [[ ! -f "$venv/bin/activate" ]]; then
  python -m venv "$venv"
fi

# Activate the virtual environment
source "$venv/bin/activate"

# Install required Python packages
pip install --upgrade pip
pip install pywinctl obsws-python

echo ""
# Run the Python script with all passed arguments
python "$folder/OBS-recording-mover.py" "$@"
