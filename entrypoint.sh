#!/bin/bash

# migrations
uv run python manage.py makemigrations
uv run python manage.py migrate

# Start the Django development server
uv run python manage.py runserver 0.0.0.0:8000

