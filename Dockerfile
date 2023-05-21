FROM openjdk:8-jdk-bullseye
WORKDIR /
ADD ./target/cbf-0.0.1-SNAPSHOT.jar cbf-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD java - jar cbf-0.0.1-SNAPSHOT.jar
