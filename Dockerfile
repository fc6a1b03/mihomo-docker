FROM alpine
RUN mkdir -p /opt/mihomo/data
WORKDIR /opt/mihomo
COPY mihomo .
RUN chmod +x mihomo
ENV TZ=Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone
EXPOSE 9090
ENTRYPOINT ["/opt/mihomo/mihomo", "-d", "data", "-f", "data/config.yaml", "-ext-ctl", ":9090"]
