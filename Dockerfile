FROM alpine:latest

WORKDIR /pb

RUN apk add --no-cache unzip ca-certificates wget \
    && URL_BASE="https://github.com" \
    && URL_PATH="/pocketbase/pocketbase/releases/download" \
    && URL_FILE="/v0.22.21/pocketbase_0.22.21_linux_amd64.zip" \
    && FINAL_URL="${URL_BASE}${URL_PATH}${URL_FILE}" \
    && wget --no-check-certificate "$FINAL_URL" -O /tmp/pb.zip \
    && unzip /tmp/pb.zip -d /pb/ \
    && rm /tmp/pb.zip

EXPOSE 8080

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
