FROM ubuntu:20.04

RUN apt update && \
    apt install -y tmate openssh-client curl && \
    apt clean

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
