FROM python:3

# Install required system packages, including distutils
RUN apt-get update && apt-get install -y python3-distutils

# Install Django 3.2
RUN pip install django==3.2

# Copy all files from the current directory into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port 8000
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
