FROM alpine:3.23@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11

ARG KUBECTL_VERSION=v1.35.3

RUN set -ex \
 && apk --no-cache add \
      bash \
      curl \
 && curl -sSfL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
 && chmod 0755 /usr/local/bin/kubectl

