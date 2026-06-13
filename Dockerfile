FROM tomcat:10-jdk11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/portfolio.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
