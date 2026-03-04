FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl wget sudo ttyd qemu-system-x86 qemu-kvm qemu qemu-utils \
    libvirt-daemon-system libvirt-clients bridge-utils virt-manager \
    cloud-image-utils \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Create data dir (for images, configs, etc.)
RUN mkdir -p /data && chmod 777 /data

# Optional: Pre-create some libvirt dirs (helps if using libvirt inside container)
RUN mkdir -p /var/lib/libvirt/images /var/run/libvirt && \
    chmod -R 777 /var/lib/libvirt /var/run/libvirt

CMD ["/start.sh"]
