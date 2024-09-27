FROM python:3.11

# Update and install required system packages, including distutils
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install django==3.2

# Copy your application files
COPY . .

# Run database migrations
RUN python manage.py migrate

# Expose port 8000
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
