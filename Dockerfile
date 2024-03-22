# this is an official Python runtime, used as the parent image
FROM python:3.12-slim-bullseye

COPY requirements.txt /

RUN pip install pip --upgrade
RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY powerdns_auth_proxy/ /powerdns_auth_proxy

CMD ["waitress-serve","--port=80","--call","powerdns_auth_proxy:create_app"]
