#!/bin/bash

# Install dependencies for Python
echo "Installing Python dependencies..."
python3 -m pip install --upgrade pip
pip install -r requirements.txt
echo "Installed Python dependencies..."
# Run Django collectstatic to gather all static files into the staticfiles directory
python3 manage.py collectstatic --noinput
