  
FROM python:3-alpine

RUN apk add --no-cache python3-dev \
   && pip3 install --upgrade pip

ADD . /apps

WORKDIR /apps

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD exec gunicorn apps.wsgi:application --bind 0.0.0.0:8000 --workers 3