FROM alpine:3.22@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412

ARG KUBECTL_VERSION=v1.34.1

RUN set -ex \
 && apk --no-cache add \
      bash \
      curl \
 && curl -sSfL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
 && chmod 0755 /usr/local/bin/kubectl

