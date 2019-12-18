# build stage
FROM golang:alpine AS build-env
RUN set -eux; \
    apk add --no-cache --virtual .build-deps \
    git gcc libc-dev;
# Enable the go modules feature
ENV GO111MODULE on
# Set the GOPROXY environment variable
ENV GOPROXY https://goproxy.io
WORKDIR /go/src/github.com/macchiang/cachet-monitor
ADD . ./
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -a -installsuffix cgo -o cachet-monitor cli/main.go
