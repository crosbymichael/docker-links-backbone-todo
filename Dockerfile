FROM crosbymichael/python

RUN pip install Flask rethinkdb
RUN pip install -e git://github.com/crosbymichael/docker-py@links#egg=docker

ADD . /app
EXPOSE 5000
WORKDIR /app

ENTRYPOINT ["python", "todo.py"]
