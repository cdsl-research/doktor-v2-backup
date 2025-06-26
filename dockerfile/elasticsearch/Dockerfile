FROM elasticdump/elasticsearch-dump:v6.119.1
RUN mkdir backup
COPY backup.sh /
RUN chmod +x backup.sh
ENTRYPOINT ["bash", "backup.sh"]
