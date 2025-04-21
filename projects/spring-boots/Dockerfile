# Use OpenJDK Alpine image
FROM openjdk:8-jdk-alpine

# Export port 8080
EXPOSE 8080

# Working directory for the app
WORKDIR /usr/src/app

# Copy wrapper and config
COPY mvnw pom.xml .
COPY .mvn .mvn

# Copy source files
COPY src ./src

# Build the app
RUN ./mvnw package

# Run project
ENTRYPOINT ["java", "-jar", "./target/docker-example-1.1.3.jar"]