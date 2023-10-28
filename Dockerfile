# Use an official Python runtime as the base image
FROM python:3.11.5

# Step 1: Use official lightweight Python image as base OS.
FROM tiangolo/uvicorn-gunicorn:python3.11-slim


# Set the working directory in the container
WORKDIR /app
COPY . .
# Copy the requirements file into the container
#COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt


# Copy the tokenizer and model files into the container
# tokenizer.pkl .
#COPY model.h5 .

# Copy the Python script into the container
#COPY routes.py .
#COPY ml_controller.py .
#COPY task_controller.py .
#COPY main.py .


# Run the Python script when the container launches
# ENTRYPOINT ["python", "main.py"]

# Step 4: Run the web service on container startup using gunicorn webserver.
ENV PORT=8080
CMD exec gunicorn --bind :$PORT main:app