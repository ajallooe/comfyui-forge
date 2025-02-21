# Base image with CUDA 12.2 ML and Ubuntu 22.04
FROM nvidia/cuda:12.8.0-cudnn-devel-ubuntu24.04

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/opt/venv/bin:$PATH"

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        wget \
        curl \
        zip \
        unzip \
        python3-pip \
        python3-venv \
        python3-dev \
        libgl1 \
        libglib2.0-0 \
        sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up Python, pip, and virtual environment
RUN python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    rm -f /usr/bin/python /usr/bin/pip && \
    ln -sf /opt/venv/bin/python /usr/bin/python && \
    ln -sf /opt/venv/bin/pip /usr/bin/pip

# Install JupyterLab and required Python packages
RUN pip install jupyterlab notebook ipywidgets

# Install PyTorch with CUDA 12.8 support
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu128

# Install ComfyUI
WORKDIR /workspace
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
WORKDIR /workspace/ComfyUI
RUN pip install -r requirements.txt

# Install ComfyUI Manager
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git manager
WORKDIR /workspace/ComfyUI/manager
RUN pip install -r requirements.txt

# Install Forge from the correct repo
WORKDIR /workspace
RUN git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git forge
# WORKDIR /workspace/forge
# RUN pip install -r requirements.txt

# Expose JupyterLab port
EXPOSE 8888

# Expose ComfyUI port
EXPOSE 8188

# Expose Forge port
EXPOSE 8388

# Start JupyterLab by default
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

