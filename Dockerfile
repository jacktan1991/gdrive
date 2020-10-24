FROM golang:1.15.3-alpine3.12 AS builder

RUN apk add git
RUN go get github.com/jacktan1991/gdrive

FROM alpine:3.12
COPY --from=builder /go/bin/gdrive /usr/local/bin/gdrive

ARG CLIENT_ID
ARG CLIENT_SECRET
ENV CLIENT_ID=${CLIENT_ID}
ENV CLIENT_SECRET=${CLIENT_SECRET}

ENTRYPOINT ["gdrive"]
