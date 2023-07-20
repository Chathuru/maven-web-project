FROM tomcat

LABEL owner=chathuru
LABEL email=chathuru@gmail.com

COPY target/maven-webapp.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
