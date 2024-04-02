# Use an official PyTorch image with Python 3.8 and CUDA support
FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

RUN apt-get update && \
    apt-get install -y libglib2.0-0 && \
    apt-get install -y libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Expose any ports the app is expecting in the environment
EXPOSE 8080

# Command to train SwinMR (PI) on CC
CMD ["python3", "main_train_swinmr.py", "--opt", "./options/SwinMR/example/train_swinmr_CCpi_G1D30.json"]
