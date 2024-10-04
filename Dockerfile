# Use the official Python image from the Docker Hub
FROM python:3.12-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:0.4.18 /uv /bin/uv

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Copy dependency files 
COPY pyproject.toml uv.lock /app/

# Install dependencies using uv, forcing the use of system Python
ENV UV_SYSTEM_PYTHON=1
RUN uv pip install --system -e .

# Copy the entire Django project into the container
COPY . /app/