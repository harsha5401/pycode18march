# Use lightweight base image
FROM python:3.9-alpine

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port
EXPOSE 5000

# Command to run the application
CMD ["gunicorn", "-b", "0.0.0.0:5000", "main:app"]
