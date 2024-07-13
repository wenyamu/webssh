FROM python:slim-bullseye

RUN apt update && apt install --no-install-recommends -y supervisor net-tools && \
    pip install --no-cache-dir paramiko==3.4.0 tornado==6.4.1 && \
    apt clean -y && \
    apt autoclean -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/* /var/cache/apt/archives/*

# webssh
ADD ./webssh /webssh/
ADD ./run.py /

# SUPERVISOR
ADD ./supervisor/supervisord.conf /etc/supervisor/
ADD ./supervisor/services /etc/supervisor/conf.d/

COPY entrypoint.sh /usr/sbin/entrypoint.sh
RUN chmod +x /usr/sbin/entrypoint.sh

CMD ["/usr/sbin/entrypoint.sh"]
