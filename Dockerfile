FROM python:3.6
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /sandbox/gistandard
WORKDIR /sandbox/gistandard
ADD . /sandbox/gistandard
RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && rm -Rf /var/lib/apt/lists/* && apt-get update
RUN apt-get update && apt-get -y install nginx
RUN pip install pip -U -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install uwsgi && pip install -r requirements
