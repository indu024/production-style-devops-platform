FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y \
    docker.io \
    curl \
    apt-transport-https

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install kind
RUN curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64 && \
    chmod +x ./kind && \
    mv ./kind /usr/local/bin/kind

USER jenkins