FROM alpine:latest

ADD "https://github.com" /tmp/pb.zip

RUN apk add --no-cache unzip ca-certificates \
    && unzip /tmp/pb.zip -d /pb/ \
    && rm /tmp/pb.zip

EXPOSE 8080

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
