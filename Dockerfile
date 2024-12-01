FROM alpine
RUN mkdir -p /opt/mihomo/data
WORKDIR /opt/mihomo
COPY mihomo .
RUN chmod +x mihomo
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone
EXPOSE 9090
ENTRYPOINT ["sh", "-c", "mihomo -d data -f data/config.yaml -ext-ctl :9090"]
