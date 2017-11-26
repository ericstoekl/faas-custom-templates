FROM openjdk:8-jre-alpine

RUN addgroup -S app && adduser -S -g app app

ENV KOTLIN_HOME /opt/kotlinc
ENV KOTLIN_VERSION 1.1.61

RUN set -o errexit -o nounset \
    && echo "Downloading Kotlin" \
    && apk --no-cache add bash ca-certificates wget curl \
    && wget --no-verbose --output-document=/tmp/kotlin-compiler.zip "https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip" \
    && mkdir -p /opt \
    && unzip -d /opt /tmp/kotlin-compiler.zip \
    && rm /tmp/kotlin-compiler.zip \
    && echo "Pulling watchdog binary from Github." \
    && curl -sSL https://github.com/openfaas/faas/releases/download/0.6.12/fwatchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog \
    && apk del curl --no-cache

RUN ln -s "${KOTLIN_HOME}/bin/kotlin" /usr/bin/kotlin \
    && ln -s "${KOTLIN_HOME}/bin/kotlinc" /usr/bin/kotlinc \
    && ln -s "${KOTLIN_HOME}/bin/kotlinc-js" /usr/bin/kotlinc-js \
    && ln -s "${KOTLIN_HOME}/bin/kotlinc-jvm" /usr/bin/kotlinc-jvm

WORKDIR /home/app

COPY index.kt .
COPY function ./function

RUN kotlinc function/handler.kt index.kt -d kt.jar
ENV fprocess="kotlin -classpath kt.jar IndexKt"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]
