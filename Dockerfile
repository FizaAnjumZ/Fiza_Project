FROM alpine:latest
RUN apk add --no-cache openjdk17-jre wget
ENV CATALINA_HOME=/usr/local/tomcat
RUN addgroup -S tomcat && adduser -S tomcat -G tomcat
RUN mkdir $CATALINA_HOME
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.61/bin/apache-tomcat-10.1.61.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xzf tomcat.tar.gz && cp -r /tmp/apache-tomcat-10.1.61/* $CATALINA_HOME/
RUN chown -R tomcat:tomcat $CATALINA_HOME
EXPOSE 7070
USER tomcat
CMD /usr/local/tomcat/bin/catalina.sh run
