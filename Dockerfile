# Use the official Python image as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Flask and any other dependencies
RUN pip install flask

# Set the environment variable for Flask (optional but recommended)
ENV FLASK_APP=app.py

# Expose the port that Flask will run on
EXPOSE 8080

# Command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]

