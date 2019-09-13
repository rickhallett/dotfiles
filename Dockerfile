FROM python

RUN apt-get update
RUN apt-get install -y zsh git curl zip

COPY ./script/test /test

ENTRYPOINT ["/test"]
