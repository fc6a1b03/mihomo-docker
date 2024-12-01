FROM scratch
COPY --from=alpine:latest /bin/sh /bin/sh
COPY mihomo .
ARG TZ=Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
EXPOSE 9090
CMD ["/mihomo", "-d", "data", "-f", "data/config.yaml", "-ext-ctl", ":9090"]
