FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install QEMU and required tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    ttyd \
    qemu-system-x86 \
    qemu-kvm \
    && rm -rf /var/lib/apt/lists/*

# Accept the host's KVM group GID as a build argument
ARG KVM_GID=107   # default value, override at build

# Create a group with that GID and a non‑root user who belongs to it
RUN groupadd -g ${KVM_GID} kvm && \
    useradd -m -s /bin/bash -G kvm kvm-user && \
    echo "kvm-user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy and set permissions for the startup script
COPY --chown=kvm-user:kvm-user start.sh /home/kvm-user/start.sh
RUN chmod +x /home/kvm-user/start.sh

# Switch to the non‑root user
USER kvm-user
WORKDIR /home/kvm-user

CMD ["/home/kvm-user/start.sh"]
