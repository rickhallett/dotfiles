FROM python

RUN apt-get update
RUN apt-get install -y zsh git curl zip

RUN useradd --create-home --shell /bin/bash user
COPY ./script/test /home/user/test

USER user
WORKDIR /home/user

ENTRYPOINT ["/home/user/test"]
