	FROM python:3.7
# collectstatic needs the secret key to be set. We store that in this environment variable.
# Set this value in this project's .env file
ARG DJANGO_SECRET_KEY

RUN mkdir -p /usr/src/app

COPY ./ch14-permissions-and-authorizations /usr/src/app
COPY ./ch14-permissions-and-authorizations Pipfile /usr/src/app/
COPY ./ch14-permissions-and-authorizations Pipfile.lock /usr/src/app/

WORKDIR /usr/src/app

RUN pip install pipenv
RUN pipenv install --system --deploy
RUN python manage.py collectstatic --no-input