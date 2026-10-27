FROM alpine:latest

WORKDIR /pb

RUN apk add --no-cache unzip ca-certificates wget \
    && wget "https://github.com" -O /tmp/pb.zip \
    && unzip /tmp/pb.zip -d /pb/ \
    && rm /tmp/pb.zip

EXPOSE 8080

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
