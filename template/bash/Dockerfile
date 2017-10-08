FROM alpine:latest
ENTRYPOINT []

RUN apk add --no-cache bash
ADD https://github.com/alexellis/faas/releases/download/v0.5-alpha/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

WORKDIR /root/

COPY function/*.bash ./
RUN bash setup.bash
ENV fprocess "bash handler.bash"

EXPOSE 8080
CMD ["/usr/bin/fwatchdog"]
