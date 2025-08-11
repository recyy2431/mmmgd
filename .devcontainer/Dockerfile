FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Base
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential git curl wget unzip jq ripgrep make pkg-config \
    ca-certificates gnupg lsb-release \
    dnsutils whois netcat-openbsd iproute2 iputils-ping traceroute \
    nmap masscan \
    python3-pip python3-venv \
    openjdk-17-jre-headless \
    wordlists seclists \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Nice-to-haves
RUN pip install --no-cache-dir pipx && pipx ensurepath

# Minimal web tooling
RUN pipx install whatweb && pipx install wafw00f && pipx install dirsearch

# The image already gets Go via the feature. Install Go-based tools at runtime in install-tools.sh
USER vscode
WORKDIR /workspaces
