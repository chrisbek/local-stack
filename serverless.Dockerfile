FROM ubuntu:20.04 as ubuntu_base
LABEL maintainer="bekos.christopher@gmail.com"


# Install nodejs
ENV NODE_VERSION=15.3.0
RUN apt-get update -y && apt-get upgrade -y
RUN apt install curl -y
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

# Install python
RUN apt-get install software-properties-common -y && add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get install python3.9 -y && apt-get install python3-pip -y && ln -s /usr/bin/python3.9 /usr/bin/python
RUN python --version
RUN pip3 install poetry==1.1
RUN poetry --version
ENV POETRY_VIRTUALENVS_IN_PROJECT=false
RUN npm set unsafe-perm true
RUN apt-get install git -y
