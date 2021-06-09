FROM registry.access.redhat.com/ubi8/ubi
ARG POD_USER_NAME=ansible
ARG POD_USER_UID=1001
ARG POD_USER_GID=0
ARG POD_HOME_DIR=/home/ansible

ENV HOME="/home/ansible"
# ENV LANG=en_US.UTF-8
# ENV LC_ALL=en_US.UTF-8

USER root

RUN echo "enabled=0" >> /etc/yum/pluginconf.d/subscripton-manager.conf
RUN dnf install -y git python38 && \
    dnf clean all && \
    rm -rf /var/cache /var/log/dnf* /var/log/yum.*
RUN pip3 install ansible==2.9.21

RUN useradd ${POD_USER_NAME} --uid ${POD_USER_UID} --gid ${POD_USER_GID} --home-dir ${POD_HOME_DIR} --create-home --shel /sbin/nologin && \
    chown -R ${POD_USER_UID}:${POD_USER_GID} ${POD_HOME_DIR} && \
    chmod -R g+w ${POD_HOME_DIR}

# WORKDIR /home/ansible
USER ${POD_USER_UID}
# ENTRYPOINT ["/bin/bash"]
# ENTRYPOINT ["/bin/sh", "-c"]
