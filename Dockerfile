FROM python:3.7-alpine

ENV PYTHONNUMBUFFERED=1
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-teps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt 
RUN apk del .tmp-build-teps
RUN mkdir /app 
WORKDIR /app 
COPY ./app /app 

RUN adduser -D user
USER user



