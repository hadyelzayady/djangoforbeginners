from python:3

ARG PROJECT=ch2-hello-world-app
ARG PROJECT_DIR=/var/www/${PROJECT}
RUN mkdir -p $PROJECT_DIR
WORKDIR $PROJECT_DIR
COPY ch2-hello-world-app/Pipfile ch2-hello-world-app/Pipfile.lock ./
RUN pip install -U pipenv
RUN pipenv install --system
# Server
EXPOSE 8000
STOPSIGNAL SIGINT
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]