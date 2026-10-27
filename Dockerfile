FROM alpine:latest

ARG PB_VERSION=0.22.21

RUN apk add --no-cache \
    unzip \
    ca-certificates

# Скачиваем и распаковываем PocketBase
ADD https://github.com{PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

EXPOSE 8080

# Запускаем сервер
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
