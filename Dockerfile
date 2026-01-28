FROM alpine:3.23@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659

ARG KUBECTL_VERSION=v1.35.0

RUN set -ex \
 && apk --no-cache add \
      bash \
      curl \
 && curl -sSfL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
 && chmod 0755 /usr/local/bin/kubectl

