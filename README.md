# Otel Spring Boot Demo

OpenTelemetry demo project for Spring Boot.

## Build

The `Dockerfile` includes the Maven build process. You can build the Docker image by executing the following command:

```bash
# Retrieve the latest tag from the current Git repository
VERSION=$(git describe --tags)

docker build -t <registry>/<repository>/otel-spring-boot-demo:$VERSION .
```
