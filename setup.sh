#!/bin/bash
# ===========================
# ComfyUI + JupyterLab Setup Script
# ===========================

# ======================
# 1. Update and Install Essentials
# ======================
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
    git \
    wget \
    curl \
    zip \
    unzip \
    python3 \
    python3-venv \
    python3-dev \
    libgl1 \
    libglib2.0-0 \
    ffmpeg \
    build-essential \
    cmake \
    sudo \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    python3.12 \
    python3.12-venv \
    python3.12-dev

# ======================
# 2. Upgrade Pip
# ======================
python3 -m ensurepip --upgrade
python3 -m pip install --upgrade pip

python3.10 -m ensurepip --upgrade
python3.10 -m pip install --upgrade pip

python3.12 -m ensurepip --upgrade
python3.12 -m pip install --upgrade pip

# ======================
# 3. Set Up Virtual Environment for ComfyUI
# ======================
python3.12 -m venv ~/venv-comfy
source ~/venv-comfy/bin/activate

# ======================
# 4. Install PyTorch Nightly (CUDA 12.6) and Jupyter in ComfyUI venv
# ======================
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu126
pip install jupyterlab notebook ipywidgets

# ======================
# 5. Install ComfyUI
# ======================
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt

# ======================
# 6. Install ComfyUI Manager (Corrected Method)
# ======================
cd ~/workspace/ComfyUI/custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager

git clone https://github.com/WASasquatch/was-node-suite-comfyui/
pip install -r was-node-suite-comfyui/requirements.txt

git clone https://github.com/yolain/ComfyUI-Easy-Use
pip install -r ComfyUI-Easy-Use/requirements.txt

git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git
pip install -r ComfyUI-Inspire-Pack/requirements.txt

git clone https://github.com/crystian/ComfyUI-Crystools.git
pip install -r ComfyUI-Crystools/requirements.txt

git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git
pip install -r ComfyUI-Impact-Pack/requirements.txt

git clone https://github.com/Fannovel16/comfyui_controlnet_aux/
pip install -r comfyui_controlnet_aux/requirements.txt

git clone https://github.com/kijai/ComfyUI-Florence2.git
pip install -r ComfyUI-Florence2/requirements.txt



pip install -r requirements.txt

# ======================
# 7. Deactivate ComfyUI venv
# ======================
deactivate

# ======================
# 8. Include Aliases to Start
# ======================
echo "if [ -f ~/aliases.sh ]; then" >> ~/.bashrc
echo "  . ~/aliases.sh" >> ~/.bashrc
echo "fi" >> ~/.bashrc
source ~/.bashrc

# ======================
# 9. Instructions for Starting Services
# ======================
echo "============================"
echo "Setup Complete"
echo "Use 'launch_comfy' to start ComfyUI."
echo "Use 'launch_jupyter' to start JupyterLab."
echo "To install Forge later, run '~/install_forge.sh'."
echo "============================"

