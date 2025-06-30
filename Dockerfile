# FROM python:3.8-slim-buster
# WORKDIR /app
# COPY . /app

# RUN apt update -y && apt install awscli -y

# RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 unzip -y && pip install -r requirements.txt
# CMD ["python3", "app.py"]
# FROM python:3.8-slim-buster

# # Set working directory
# WORKDIR /app




# # Copy all project files
# COPY . /app

# # Update packages and install system dependencies
# RUN apt-get update && \
#     apt-get install -y awscli ffmpeg libsm6 libxext6 unzip && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

# # Ensure pip is up to date and install dependencies
# RUN pip install --upgrade pip && \
#     pip install -r requirements.txt

# # Run the application
# CMD ["python3", "app.py"]

# Use slim Python 3.8 as base
FROM python:3.8-slim-buster

# Set working directory inside the container
WORKDIR /app




# Copy all project files to the container
COPY . /app

# Update package lists and install system dependencies
RUN apt-get update && \
    apt-get install -y awscli ffmpeg libsm6 libxext6 unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and force-install dependencies
# Override scikit-learn version to 1.2.2 to avoid deployment errors
RUN pip install --upgrade pip && \
    pip install scikit-learn==1.2.2 && \
    pip install --no-deps -r requirements.txt

# Set default command to run the app
CMD ["python3", "app.py"]

