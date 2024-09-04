# pull the tomcat docker image from docker hub
FROM tomcat:latest

# person who is maintinag the docker file
MAINTAINER "mohitprasanna@gmail.com"

# copying the the helloworld target war package from the target to destincation tomcat Container directory
COPY ./target/wwp-1.0.0.war /usr/local/tomcat/webapps/
