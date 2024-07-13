FROM python:3-alpine

ADD . /

RUN  pip install -r requirements.txt --no-cache-dir

EXPOSE 8888/tcp

WORKDIR /code

CMD ["python", "run.py"]
