FROM alpine

COPY bin/kubebot_linux_amd64 /kubebot
ENTRYPOINT [ "/kubebot" ]
