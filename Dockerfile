FROM python:3.12-alpine

COPY broadlink_ac_mqtt /app/broadlink_ac_mqtt
COPY log /app/log
COPY monitor.py /app/monitor.py
COPY requirements.txt /app/requirements.txt

RUN apk add --no-cache libffi-dev procps \
    && pip3 install --no-cache-dir -r /app/requirements.txt

CMD ["python", "/app/monitor.py", "-c", "/config/config.yml"]