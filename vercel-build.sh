#!/bin/bash

# Ensure virtual environment is set up properly on Vercel (if needed)
echo "Setting up Python environment...1"
python3 -m venv venv
source venv/bin/activate

# Install Python dependencies
echo "Installing Python dependencies..."
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt || { echo "Failed to install dependencies."; exit 1; }
echo "Installed Python dependencies..."

# Run Django collectstatic to gather all static files into the staticfiles directory
echo "Running collectstatic..."
python3 manage.py collectstatic --noinput || { echo "collectstatic failed."; exit 1; }

echo "Build completed successfully!"
