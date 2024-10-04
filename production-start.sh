#!/bin/bash

# Collect static files
python manage.py collectstatic --noinput

# Apply database migrations
python manage.py migrate --noinput

# Start Gunicorn
gunicorn a_core.wsgi --bind 0.0.0.0:8000