# Version: 0.0.1
FROM alt

MAINTAINER Alexander Karpunin <ak@shakra.ru>
RUN apt-get update

RUN apt-get install -y mc glibc-locales startup passwd su sudo

RUN echo LANG=ru_RU.UTF-8 > /etc/sysconfig/i18n
RUN echo SUPPORTED=ru_RU.UTF-8 >> /etc/sysconfig/i18n

RUN echo "root:0123456789" | chpasswd
RUN adduser -G wheel -m -r alto
RUN usermod -u 500 alto
RUN echo "alto:12345" | chpasswd
RUN echo "WHEEL_USERS ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers



EXPOSE 3306

CMD ["/bin/su", "-l", "alto"]
