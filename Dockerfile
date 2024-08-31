# Dockerfile for book_catalog microservice
# Use a Python base image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install python-dotenv for loading .env file
RUN pip install python-dotenv

# Copy the rest of the application code into the container
COPY . .

# Copy the .env file into the container
COPY .env .

# Make port 80 available to the world outside this container
EXPOSE 80

# Run main.py when the container launches
CMD ["python", "main.py"]
