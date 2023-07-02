FROM apache/airflow:2.6.2
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libssl-dev \
        libffi-dev \
        libpq-dev \
        nano \
        default-libmysqlclient-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER airflow


RUN mkdir -p /opt/airflow/python_tasks
WORKDIR /opt/airflow/python_tasks
ENV BUCKET_NAME=weather-api-raw-s3
ENV REGION_NAME=us-east-1
ENV TRANS_BUCKET_NAME=weather-api-transformed-s3
COPY /python_tasks/. .
RUN pip install -r requirements.txt
WORKDIR /opt/airflow/dags
COPY /dags/. .
WORKDIR /
RUN airflow db init
RUN airflow users  create --role Admin --username admin --email emmanueloffisong2002@yahoo.com --firstname Emmanuel --lastname Offisong --password admin


CMD  ["airflow","scheduler"]
