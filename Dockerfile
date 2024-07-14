FROM python:slim-bullseye

# webssh
ADD ./webssh /webssh/
ADD ./run.py /
ADD ./requirements.txt /

RUN apt update && \
    apt install --no-install-recommends -y supervisor && \
    pip install -r requirements.txt --no-cache-dir && \
    apt clean -y && \
    apt autoclean -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/* /var/cache/apt/archives/*

# SUPERVISOR
ADD ./supervisor/supervisord.conf /etc/supervisor/
ADD ./supervisor/services /etc/supervisor/conf.d/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
