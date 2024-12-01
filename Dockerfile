FROM scratch
COPY mihomo .
COPY --from=alpine:latest /bin/sh /bin/sh
COPY --from=alpine:latest /usr/share/zoneinfo/Asia/Shanghai /usr/share/zoneinfo/Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
EXPOSE 9090
CMD ["/mihomo", "-d", "data", "-f", "data/config.yaml", "-ext-ctl", ":9090"]
