FROM golang:1.19-alpine3.16 as builder

WORKDIR /app/src

COPY go.* ./
COPY cmd/ ./cmd/
COPY internal/ ./internal/

RUN go build -o /app/bin/idrac_exporter ./cmd/idrac_exporter

FROM alpine:3.16

WORKDIR /app

COPY --from=builder /app/bin /app/bin

ENTRYPOINT ["bin/idrac_exporter"]
