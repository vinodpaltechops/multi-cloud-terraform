FROM ghcr.io/actions/actions-runner:latest

# Switch to root to install packages
USER root

# 1. Install foundational tools FIRST (especially lsb-release)
RUN apt-get update && apt-get install -y \
  curl \
  unzip \
  git \
  jq \
  wget \
  gnupg \
  software-properties-common \
  ca-certificates \
  lsb-release \
  && rm -rf /var/lib/apt/lists/*

# 2. Install Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get install -y nodejs \
  && node --version

# 3. Install Terraform CLI (Using lsb_release now that it's installed)
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor \
  -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
  | tee /etc/apt/sources.list.d/hashicorp.list \
  && apt-get update \
  && apt-get install -y terraform

# 4. Install AWS CLI (Detects ARM vs Intel to prevent QEMU errors)
RUN if [ "$(uname -m)" = "x86_64" ]; then \
        ARCH="x86_64"; \
    else \
        ARCH="aarch64"; \
    fi && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-${ARCH}.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# 5. Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Switch back to runner user for security
USER runner