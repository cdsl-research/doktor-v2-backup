FROM ubuntu:24.04
RUN apt-get update && apt-get install -y curl
RUN curl -L https://dl.min.io/client/mc/release/linux-amd64/mc -o /bin/mc
RUN chmod +x /bin/mc
RUN export PATH=$PATH:/bin/
RUN mkdir backup
COPY backup.sh /
RUN chmod +x backup.sh
ENTRYPOINT ["bash", "backup.sh"]