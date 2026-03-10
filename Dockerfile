FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl wget sudo ttyd qemu-system-x86 qemu-kvm qemu qemu-utils \
    libvirt-daemon-system libvirt-clients bridge-utils virt-manager \
    cloud-image-utils \
    python3 python3-pip python3-venv gnupg \
    && rm -rf /var/lib/apt/lists/*

# Add Zabbly Incus repository (recommended source for Ubuntu 22.04)
RUN curl -fsSL https://pkgs.zabbly.com/key.asc | gpg --dearmor -o /usr/share/keyrings/zabbly.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/zabbly.gpg] https://pkgs.zabbly.com/incus/stable jammy main" > /etc/apt/sources.list.d/incus.list

RUN apt-get update && apt-get install -y incus \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Create data dir (for images, configs, etc. — useful for both libvirt & incus)
RUN mkdir -p /data && chmod 777 /data

# Pre-create some libvirt dirs (helps if using libvirt inside container)
RUN mkdir -p /var/lib/libvirt/images /var/run/libvirt && \
    chmod -R 777 /var/lib/libvirt /var/run/libvirt

# Optional: Pre-create common Incus paths (helps avoid permission issues later)
RUN mkdir -p /var/lib/incus && chmod -R 777 /var/lib/incus

CMD ["/start.sh"]
