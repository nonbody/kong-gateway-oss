ARG BUILDER_IMAGE=golang:1.16-alpine
ARG BASE_IMAGE=alpine:3.14

### Builder Image
FROM $BUILDER_IMAGE AS builder
ENV GOOS=linux

RUN  apk update && apk --no-cache add gcc git
WORKDIR /goapp
COPY . .

RUN  go build -o app main.go

### Application Image
FROM $BASE_IMAGE

RUN apk --no-cache add ca-certificates tzdata
ENV TZ Asia/Bangkok

WORKDIR /root/

COPY --from=builder /goapp/app .

EXPOSE 3000

ENTRYPOINT ["./app"]

