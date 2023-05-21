# FROM openjdk:8-jdk-bullseye
# WORKDIR /
# ADD ./target/cbf-0.0.1-SNAPSHOT.jar cbf-0.0.1-SNAPSHOT.jar
# EXPOSE 8080
# CMD java - jar cbf-0.0.1-SNAPSHOT.jar
#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:8-jdk-bullseye
COPY --from=build /home/app/target/cbf-0.0.1-SNAPSHOT.jar /usr/local/lib/cbf-0.0.1-SNAPSHOT.jar
ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/cbf-0.0.1-SNAPSHOT.jar"]