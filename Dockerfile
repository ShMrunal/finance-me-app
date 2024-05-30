FROM openjdk:11
WORKDIR /app
COPY target/*.jar app.jar
Expose 8082
ENTRYPOINT ["java", "-jar", "app.jar"]
