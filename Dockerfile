# Use an official Python runtime as a parent image
FROM ghcr.io/astral-sh/uv:python3.12-alpine as builder

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set up directory structure
WORKDIR /app/

# Copy dependency files 
COPY pyproject.toml uv.lock /app/

# Install dependencies using uv, forcing the use of system Python
ENV UV_SYSTEM_PYTHON=1
RUN uv sync --frozen --no-install-project

# Expose the port the app runs on
EXPOSE 8000

# Copy the rest of the application code
COPY . /app/

# Run the application
CMD ["uv", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]