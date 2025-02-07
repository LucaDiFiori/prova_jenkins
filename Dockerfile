FROM jenkins/agent:alpine-jdk11
USER root
RUN apk update 
RUN apk add --no-cache build-base
USER jenkins
