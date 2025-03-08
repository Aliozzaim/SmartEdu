#!/bin/bash

# Check for virtual environment
echo "Checking virtual environment..."
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Warning: Virtual environment is not activated!"
    exit 1
fi

# Install Python dependencies
echo "Installing Python dependencies..."
python -m pip install --upgrade pip
pip install -r requirements.txt || { echo "Failed to install dependencies."; exit 1; }

# Collect static files
echo "Running collectstatic..."
python manage.py collectstatic --noinput || { echo "collectstatic failed."; exit 1; }

echo "Build completed successfully!"

