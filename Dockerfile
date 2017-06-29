FROM alpine:3.2

#MAINTAINER Andreas Linz <klingt.net@gmail.com>
MAINTAINER David Low <dhl88@cornell.edu>

RUN apk update &&\
    apk --no-cache add \
            bash\
            zsh\
            ncurses\
            vim\
            ctags\
            openssh\
            git &&\
    rm -rf /var/cache/apk/* &&\
    echo "root:root" | chpasswd &&\
    echo "alias vi='vim'" >> /root/.bashrc

EXPOSE 22

COPY ./.vimrc /root/.vimrc
COPY ./entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
