# Use the official Python image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install django==3.2

# Copy the entire app to the working directory
COPY . .

# Run migrations
RUN python manage.py migrate

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

