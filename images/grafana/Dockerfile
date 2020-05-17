FROM alpine:latest

RUN apk update
RUN apk add --no-cache libc6-compat

COPY ./files/grafana ./grafana
RUN chmod -R 777 ./grafana

EXPOSE 3000
WORKDIR ./grafana/bin

CMD [ "./grafana-server" ]