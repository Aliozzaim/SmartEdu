#!/bin/bash

# Ensure virtual environment is activated (optional, if needed)
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Warning: Virtual environment is not activated!"
    echo "You can activate it by running 'source /path/to/venv/bin/activate'"
    exit 1
fi

# Install dependencies for Python
echo "Installing Python dependencies..."
python -m pip install --upgrade pip
pip install -r requirements.txt

# Run Django collectstatic to gather all static files into the staticfiles directory
echo "Running Django collectstatic..."
python manage.py collectstatic --noinput

echo "Static files collected successfully!"
