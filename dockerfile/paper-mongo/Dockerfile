FROM mongo:5.0
RUN mkdir backup
COPY backup.sh /
RUN chmod +x backup.sh
ENTRYPOINT ["bash", "backup.sh"]