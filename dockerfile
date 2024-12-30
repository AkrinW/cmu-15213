FROM ubuntu:22.04
# WORKDIR /bustub
# COPY . /cmu-15445

ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /root


RUN apt-get update && apt-get install -y git

# RUN git config --global http.proxy http://127.0.0.1:7890
# RUN git config --global https.proxy http://127.0.0.1:7890

# RUN git clone https://github.com/AkrinW/cmu-15213.git


RUN apt-get update && apt-get install -y \
    build-essential \
    binutils \
    gdb \
    gcc-multilib \
    git \
    netcat \
    valgrind \
    python3 \
    vim \
    sudo \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Copy the SSH private key and set the correct permissions
COPY id_rsa /root/.ssh/id_rsa
COPY config /root/.ssh/config
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/config

# # Add GitHub's SSH key to known_hosts to prevent host authenticity prompt
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone git@github.com:AkrinW/cmu-15213.git

# 设置默认命令为 bash
CMD ["/bin/bash"]

# build command
# docker build --network=host -t <imagename> .
# docker build --network=host -t bustub-dev .

# run container
# docker run -it --rm <imagename>
# docker run -it bustub-dev
# docker run -it --name <container> <image>
# 列出所有容器
# docker ps -a
# docker start <container>