#!/bin/sh

# Apply database migrations
echo "Applying database migrations..."
uv run python manage.py migrate

# Create superuser if not exists
echo "Creating superuser..."
uv run python manage.py shell << END
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='$SUPERUSER_USERNAME').exists():
    User.objects.create_superuser('$SUPERUSER_USERNAME', '$SUPERUSER_EMAIL', '$SUPERUSER_PASSWORD')
    print('Superuser created.')
else:
    print('Superuser already exists.')
END

# Start the server
echo "Starting server..."
exec uv run python manage.py runserver 0.0.0.0:8000