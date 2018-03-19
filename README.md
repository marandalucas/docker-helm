# Kubernetes Client

## Supported tags and respective `Dockerfile` links
* `v1.9.0`, `latest`    [(v1.9.0/Dockerfile)](https://github.com/marandalucas/kubectl/blob/v1.9.0/Dockerfile)
* `v1.8.6`, `latest`    [(v1.8.6/Dockerfile)](https://github.com/marandalucas/kubectl/blob/v1.8.6/Dockerfile)
* `v1.7.12`,     [(v1.7.12/Dockerfile)](https://github.com/marandalucas/kubectl/blob/v1.7.12/Dockerfile)

## Overview
This container provides the Kubernetes client kubectl which can be used to interact with a Kubernetes cluster.

## Build
`docker build -t sockmal/kubectl:VERSION .`

## Run
`docker run --rm sockmal/kubectl:VERSION --server=http://<server-name>:8080 get pods`
