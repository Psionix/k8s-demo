FROM adoptopenjdk/maven-openjdk11 AS builder
ADD . /src
WORKDIR /src
RUN mvn package

FROM alpine:3.12.0 AS packager
RUN apk --no-cache add openjdk11-jdk openjdk11-jmods
ENV JAVA_MINIMAL="/opt/java-minimal"
RUN /usr/lib/jvm/java-11-openjdk/bin/jlink \
    --add-modules \
    java.base,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument \
    --compress 2 --strip-debug --no-header-files --no-man-pages \
    --output "$JAVA_MINIMAL" \
    --verbose

FROM alpine:3.12.0
ENV JAVA_HOME=/opt/java-minimal
ENV PATH="$PATH:$JAVA_HOME/bin"
COPY --from=packager "$JAVA_HOME" "$JAVA_HOME"
COPY --from=builder /src/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]