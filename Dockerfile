FROM tomcat

LABEL owner=chathuru

COPY target/maven-webapp.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
