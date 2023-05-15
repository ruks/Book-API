# Use the official Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .
COPY tls/private_key.key /app
COPY tls/certificate.crt /app

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask API code to the working directory
COPY books.py .

# Expose the port on which the Flask API will run
EXPOSE 5000

USER 10014

# Set the entrypoint command to run the Flask API
CMD ["python", "books.py"]
