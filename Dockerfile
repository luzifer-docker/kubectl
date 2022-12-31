FROM alpine

ARG KUBECTL_VERSION=v1.26.0

RUN set -ex \
 && apk --no-cache add \
      curl \
 && curl -sSfL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
 && chmod 0755 /usr/local/bin/kubectl

