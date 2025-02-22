#!/bin/bash
# ===========================
# Optional Forge Installation Script
# ===========================

# ======================
# 1. Create and Activate Virtual Environment for Forge (Python 3.10)
# ======================
python3.10 -m venv ~/venv-forge
source ~/venv-forge/bin/activate

# ======================
# 2. Install PyTorch 2.3.1 for Forge
# ======================
pip install torch==2.3.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

# ======================
# 3. Install TCMalloc
# ======================
sudo apt-get install -y google-perftools libgoogle-perftools-dev
echo "export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4" >> ~/.bashrc
source ~/.bashrc

# ======================
# 4. Navigate to the workspace directory
# ======================
cd ~/workspace

# ======================
# 5. Clone the Forge repository and set permissions
# ======================
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git forge
cd forge
chmod +x webui.sh

# ======================
# 6. Complete Installation by Running webui.sh
# ======================
./webui.sh

echo "============================"
echo "Forge installed! Start with: launch_forge"
echo "============================"

