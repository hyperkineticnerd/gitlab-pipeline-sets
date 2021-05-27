FROM registry.access.redhat.com/ubi8/python-38

USER 0
RUN echo "enabled=0" >> /etc/yum/pluginconf.d/subscripton-manager.conf
RUN pip install ansible==2.9

USER 1001
