FROM registry.access.redhat.com/ubi7/ubi:7.6-239

ENTRYPOINT ["/bin/bash"]

CMD ["/entrypoint.sh"]

ENV ["HOME=/opt/configdir"]

COPY ["install.sh", "entrypoint.sh", "./"]

COPY ["/assets/jodconverter-tomcat-2.2.2.zip", "./tmp/"] 

RUN chmod +x /install.sh /entrypoint.sh && \
    sh /install.sh && \
    chmod -R og+r /opt/jodconverter-tomcat-2.2.2/conf/ && \
    chmod -R og+rw /opt/jodconverter-tomcat-2.2.2/work/ \
                   /opt/jodconverter-tomcat-2.2.2/temp/ \
                   /opt/jodconverter-tomcat-2.2.2/logs/ || :

EXPOSE 8080

USER 12345
