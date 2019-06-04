from python:3

ARG PROJECT=ch14-permissions-and-authorizations
ARG PROJECT_DIR=/var/www/${PROJECT}
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY Pipfile Pipfile.lock ./
RUN pip install -U pipenv
RUN pipenv install --system
# Server
EXPOSE 8000
STOPSIGNAL SIGINT
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]