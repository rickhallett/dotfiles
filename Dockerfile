FROM python

RUN apt-get update
RUN apt-get install -y zsh git curl zip

RUN useradd --create-home --shell /bin/bash user
USER user
WORKDIR /home/user

COPY ./script/test /home/user/test
ENTRYPOINT ["/home/user/test"]
