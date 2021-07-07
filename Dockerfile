FROM golang:1.15 as builder

WORKDIR /src
COPY . .

ENV CGO_ENABLED=0

RUN export COMMIT=$(git rev-parse --short HEAD) \
        DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
        TAG=$(git describe --tags --abbrev=0 HEAD) && \
    export COMMIT=${COMMIT:-NO_COMMIT} \
        DATE=${DATE:-NO_DATE} \
        TAG=${TAG:-NO_TAG} && \
    go build -o kubebot_linux_amd64 
FROM alpine

COPY --from=builder kubebot_linux_amd64 /kubebot
ENTRYPOINT [ "/kubebot" ]
