FROM registry.access.redhat.com/ubi8/ubi

COPY requirements.txt .

RUN echo "enabled=0" >> /etc/yum/pluginconf.d/subscripton-manager.conf
RUN dnf install -y python39 && \
    pip3 install -r requirements.txt

CMD ./manage.py startapp welcome
