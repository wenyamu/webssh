FROM python:3-alpine

ADD webssh /
ADD run.py /

RUN  pip install -r requirements.txt --no-cache-dir

EXPOSE 8888/tcp

CMD ["python", "run.py"]
