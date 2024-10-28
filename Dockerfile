# ベースイメージをインストール
# Ubuntu 22.04.3 LTS（Jammy Jellyfish：debian）/ PyTorch 2.0.0+cu118）/ Python 3.10.12 / CUDA 11.8.0 / JupyterLab 4.2.5 /Jupyter Notebook 6.5.7
FROM rehabc/pytorch2.0.0-python3.10-cuda11.8-jupyter

## ベースイメージをインストール
# FROM runpod/pytorch:2.0.1-py3.10-cuda11.8.0-devel-ubuntu22.04
#
## JupyterLab・Jupyter Notebookのインストール
# RUN pip3 install --root-user-action=ignore --no-cache-dir -U jupyterlab==4.2.5 ipywidgets==8.1.5 jupyter-archive==3.4.0 jupyter_contrib_nbextensions==0.7.0 
# RUN pip3 install --root-user-action=ignore notebook==6.5.7
# RUN jupyter contrib nbextension install --user && \
#    jupyter labextension enable widgetsnbextension
#
## CUDA 11.8用のPytorchをインストール
# RUN pip3 install --root-user-action=ignore torch==2.0.0 torchvision==0.15.1 torchaudio==2.0.1 --index-url https://download.pytorch.org/whl/cu118
#
## CUDA 11.8用のcuDNNをインストール
# RUN pip3 install --root-user-action=ignore nvidia-cudnn-cu12==8.9.6.50


# ffmpegなどをインストール
RUN apt-get update
RUN apt install -y build-essential=12.9ubuntu3 python3-dev=3.10.6-1~22.04.1 python3.10-dev=3.10.12-1~22.04.6 ffmpeg=7:4.4.2-0ubuntu0.22.04.1 software-properties-common=0.99.22.9 git-all=1:2.34.1-1ubuntu1.11 zip=3.0-12build2 unzip=6.0-26ubuntu3.2
RUN apt-get clean

# pip==23.0.1へダウングレード
RUN pip3 install --root-user-action=ignore --upgrade pip==23.0.1

# CUDA 11.8用のcuDNNをインストール
RUN pip3 install --root-user-action=ignore nvidia-cudnn-cu12==8.9.6.50

# JupyterLabの日本語化ファイルのインストール
RUN pip3 install --root-user-action=ignore jupyterlab-language-pack-ja-JP==4.2.post3
