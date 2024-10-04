#!/bin/bash

# migrations
uv run python manage.py makemigrations
uv run python manage.py migrate

# Collect static files
uv run python manage.py collectstatic --noinput

# Start the Django development server
uv run python manage.py runserver 0.0.0.0:8000

