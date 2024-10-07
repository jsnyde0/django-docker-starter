# Use an official Python runtime as a parent image
FROM ghcr.io/astral-sh/uv:python3.12-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set up directory structure
WORKDIR /app/

# Copy dependency files 
COPY pyproject.toml uv.lock /app/

# Install dependencies using uv, forcing the use of system Python
RUN uv sync --frozen

# Expose the port the app runs on
EXPOSE 8000

# Copy the rest of the application code
COPY . /app/