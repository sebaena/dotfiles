FROM fedora:latest

# Set environment variables to avoid interactive prompts
# ENV TZ=Europe/Helsinki \
#     LANG=fi_FI.UTF-8 \
#     LC_ALL=fi_FI.UTF-8

RUN dnf update -y && \
    dnf install -y \
    neovim \
    git \
    ripgrep \
    python3 \
    python3-pip \
    nodejs \
    npm \
    curl \
    unzip \
    gcc \
    make \
    cmake \
    unzip \
    luarocks && \
    dnf clean all

# Create a non-root user (recommended)
RUN useradd -m dev
USER dev
WORKDIR /home/dev
RUN mkdir -p /home/dev/.config/nvim
