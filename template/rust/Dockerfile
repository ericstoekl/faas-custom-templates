FROM alpine:3.6 as builder
RUN apk add --no-cache curl \
    && curl -SL https://github.com/alexellis/faas/releases/download/0.6.4/fwatchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog \
    && apk --no-cache del curl

WORKDIR /root/

RUN apk add --no-cache gcc \
                       musl-dev \
                       rust \
                       cargo

RUN mkdir src

COPY Cargo.toml .

WORKDIR /root/src/

COPY src/       .
COPY function/  .

WORKDIR /root/

RUN cargo build --release \
 && chmod +x /root/target/release/base-rust

ENV fprocess="/root/target/release/base-rust"
CMD ["fwatchdog"]

