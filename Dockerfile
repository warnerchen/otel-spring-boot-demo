FROM harbor.warnerchen.com/library/maven:3.8.5-openjdk-17-slim AS builder

WORKDIR /build

COPY . .

RUN mvn clean package -DskipTests

FROM harbor.warnerchen.com/library/openjdk:17-slim

WORKDIR /app

COPY --from=builder /build/target/*.jar app.jar

ENV TINI_VERSION v0.19.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

RUN chmod +x /tini

ENTRYPOINT ["/tini", "--", "sh", "-c", "java $JAVA_AGENT_OPTS $JAVA_OPTS -jar app.jar"]
