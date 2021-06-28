FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
    && pacman -S stack zip unzip graphviz --noconfirm && \
    stack upgrade

# maude
ENV MAUDE_URL http://maude.cs.illinois.edu/w/images/5/5d/Maude-2.7.1-linux.zip
## http://maude.cs.illinois.edu/w/images/3/38/Maude-3.1-linux.zip
RUN set -xe \
    && mkdir -p /dependencies \ 	
    && curl -q -s -S -L --create-dirs -o maude.zip $MAUDE_URL \
    && unzip maude.zip -d /dependencies \
    && mv /dependencies/maude.linux64 /dependencies/maude \
    && chmod -R +x /dependencies \
    && cp -R dependencies/* /usr/local/bin \
    && ln -s /usr/lib/libtinfo.so.6 /usr/lib/libtinfo.so.5

WORKDIR /tamarin-prover

COPY . .

RUN useradd -m tamarin \
    && chmod 775 . && chown -R tamarin:tamarin .
USER tamarin

RUN make default

WORKDIR /home/tamarin/.local/bin

ENTRYPOINT ["./tamarin-prover"]

CMD ["--help"]
