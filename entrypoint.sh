#!/bin/sh

echo "Starting Django app..."

# Apply migrations
python manage.py migrate

# Collect static files (safe even if not used)
python manage.py collectstatic --noinput

# Start server
exec "$@"