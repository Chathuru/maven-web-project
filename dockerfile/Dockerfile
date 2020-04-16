FROM tomcat

RUN wget --no-check-certificate http://192.168.118.40:8081/repository/maven-releases/local/wso2/webapp/1.0/maven-webapp.war -O /usr/local/tomcat/webapps/maven-webapp.war

CMD ["catalina.sh", "run"]
