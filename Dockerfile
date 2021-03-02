FROM ubuntu:20.04

COPY ./entrypoint.sh ./entrypoint.sh

RUN apt-get update \
    && apt-get install -y fio \
    && apt-get clean \
    && chmod +x ./entrypoint.sh

CMD [ "./entrypoint.sh" ]
