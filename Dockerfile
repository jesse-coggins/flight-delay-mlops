# Use Python 3.9 slim image as base
FROM python:3.9-slim

# Set working directory in container
WORKDIR /app

# Copy requirements file first (for better caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY deployment_api.py .
COPY airport_encodings.json .
COPY finalized_model.pkl .

# Expose port 8000
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "deployment_api:app", "--host", "0.0.0.0", "--port", "8000"]