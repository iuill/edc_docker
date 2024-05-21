# FROM mcr.microsoft.com/devcontainers/python:3.12
FROM nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu20.04

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    git \
    wget \
    vim \
    locales-all \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/miniconda3

ENV PATH="/miniconda3/bin:${PATH}"

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda3/miniconda.sh && \
    bash /tmp/miniconda3/miniconda.sh -b -u -p /miniconda3 && \
    rm -rf /tmp/miniconda3/miniconda.sh

RUN git clone https://github.com/clear-nus/edc.git /app
WORKDIR /app

RUN pip install --upgrade pip && \
    conda update -n base -c defaults conda && \
    conda env create -n edc_env -f environment.yml && \
    conda init && \
    echo "conda activate edc_env" >> ~/.bashrc

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ=Asia/Tokyo

CMD ["/bin/bash"]
