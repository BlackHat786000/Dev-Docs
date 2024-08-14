# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    python3-pip \
    nano \
    vim \
    git \
    wget \
    curl \
    tmux

# Install Ansible
RUN apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

# Set the working directory
WORKDIR /home/ubuntu

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set a default command
CMD ["bash"]
