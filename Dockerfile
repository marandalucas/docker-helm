FROM alpine:3.7

LABEL MAINTAINER Marcos Aranda

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

#VARIABLES KUBECTL
ENV KUBE_LATEST_VERSION="v1.8.6"

#VARIABLES HELM
ENV HELM_VERSION v2.8.1
ENV FILENAME helm-${HELM_VERSION}-linux-amd64.tar.gz
ENV HELM_URL https://storage.googleapis.com/kubernetes-helm/${FILENAME}

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && curl -o /tmp/$FILENAME ${HELM_URL} \
 && tar -zxvf /tmp/${FILENAME} -C /tmp \
 && mv /tmp/linux-amd64/helm /bin/helm \
 && rm -rf /tmp \
 && apk del --purge deps \
 && rm /var/cache/apk/*

# Install Helm plugins
RUN helm init --client-only

ENTRYPOINT ["helm"]