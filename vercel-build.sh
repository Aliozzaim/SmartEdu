#!/bin/bash

# Set up Python environment
echo "Setting up Python environment..."
python3 -m venv venv
source venv/bin/activate

# Install SQLite dependencies
echo "Installing SQLite dependencies..."
apt-get update && apt-get install -y sqlite3 libsqlite3-dev

# Install Python dependencies
echo "Installing Python dependencies..."
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt || { echo "Failed to install dependencies."; exit 1; }

echo "Installed Python dependencies..."

# Run migrations to ensure the database schema is up-to-date
echo "Running migrations..."
python3 manage.py migrate || { echo "Migrations failed."; exit 1; }

# Run Django collectstatic to gather all static files into the staticfiles directory
echo "Running collectstatic..."
python3 manage.py collectstatic --noinput || { echo "collectstatic failed."; exit 1; }

echo "Build completed successfully!"
