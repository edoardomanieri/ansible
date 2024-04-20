FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install sudo -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS workspace
ARG TAGS
RUN addgroup --gid 1000 edoman
RUN adduser --gecos edoman --uid 1000 --gid 1000 --disabled-password edoman && \
    echo "edoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER edoman
WORKDIR /home/edoman

FROM workspace
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

