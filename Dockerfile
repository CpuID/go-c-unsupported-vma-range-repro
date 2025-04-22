ARG GO_VERSION
ARG REPO_GH_USER
ARG REPO_NAME
ARG REPO_REF

FROM golang:${GO_VERSION}-bookworm AS builder

RUN apt update && \
    apt install -y git && \
    mkdir -p /go/src/github.com/${REPO_GH_USER}
RUN git clone https://github.com/${REPO_GH_USER}/${REPO_NAME} /go/src/github.com/${REPO_GH_USER}/${REPO_NAME} && \
    cd /go/src/github.com/${REPO_GH_USER}/${REPO_NAME} && \
    git checkout ${REPO_REF}

WORKDIR /go/src/github.com/${REPO_GH_USER}/${REPO_NAME}/

RUN make
