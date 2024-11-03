# Base image can be selected based on the application requirements
FROM ubuntu:20.04

# Install necessary packages without restrictions
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget \
    vim \
    git \
    net-tools \
    iputils-ping \
    python3-pip \
    && apt-get clean

# Set the working directory
WORKDIR /usr/src/app

# Copy application files into the container
COPY . .

# Make the run script executable
RUN chmod +x run_gotty.sh

# Install Python packages if there is a requirements file
RUN if [ -f requirements.txt ]; then pip3 install --no-cache-dir -r requirements.txt; fi

# Expose necessary ports
EXPOSE 80
EXPOSE 443

# Set the default command to start the application
CMD ["bash", "run_gotty.sh"]
