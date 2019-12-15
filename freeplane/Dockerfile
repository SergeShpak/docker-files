FROM ssh-docker-files/jre:1.0

RUN apt-get update \
    && apt-get install -y \
        freeplane \
    && rm -rf /var/lib/apt/lists/*

ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME
WORKDIR $HOME

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
CMD ["start.sh"]