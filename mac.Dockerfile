FROM sickcodes/docker-osx:ventura AS base
WORKDIR /usr/local/bin
WORKDIR /home/edoman
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
CMD ["sh", "-c"]
# RUN brew install ansible

# COPY . .
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

