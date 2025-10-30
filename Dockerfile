FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/usermgmt-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

# TODO: You can add ENV variables or ARG for production configs
