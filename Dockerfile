FROM jenkinsci/jenkins

ENV REF_PLUGINS=/usr/share/jenkins/ref/plugins

USER root
COPY plugins/* $REF_PLUGINS/
RUN chown -R jenkins:jenkins $REF_PLUGINS
USER jenkins
RUN /usr/local/bin/plugins.sh $REF_PLUGINS/plugins.txt && rm -rf $REF_PLUGINS/plugins.txt
