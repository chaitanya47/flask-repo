# Use the official lightweight Python 3.9 image as the base
# 'slim' reduces image size by excluding unnecessary packages
FROM python:3.9-slim

# Set the working directory inside the container to /app
# All subsequent commands will be run relative to this directory
WORKDIR /app

# Copy the requirements file from the host into the container
# This file lists all Python dependencies needed for the app
COPY requirements.txt .

# Install the Python dependencies from requirements.txt
# --no-cache-dir prevents pip from caching packages to reduce image size
RUN pip install --no-cache-dir -r requirements.txt

# Copy the main application file into the container
COPY app.py .

# Inform Docker that the container will listen on port 5000 at runtime
EXPOSE 5000

# Define the command to run the application when the container starts
# Here we start the Python app
CMD ["python", "app.py"]
