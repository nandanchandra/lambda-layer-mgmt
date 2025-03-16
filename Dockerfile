FROM amazonlinux:2023
RUN ulimit -n 1024 && yum -y update && yum -y install \
    python3.9 \
    python3.9-pip \
    python3.9-devel \
    zip \
    && yum clean all

RUN python3 -m pip install pip
RUN pip install virtualenv
