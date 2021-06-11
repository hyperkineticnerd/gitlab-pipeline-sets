FROM registry.access.redhat.com/ubi8/python-39

COPY requirements.txt ./

RUN pip3 install -r requirements.txt

Add /src /app

WORKDIR /app

CMD ["python3", "app.py"]
