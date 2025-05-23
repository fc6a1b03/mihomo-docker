FROM alpine
RUN mkdir -p /opt/mihomo/data
WORKDIR /opt/mihomo
COPY mihomo .
RUN chmod +x mihomo
EXPOSE 9090
CMD ["/opt/mihomo/mihomo", "-d", "data", "-f", "data/config.yaml", "-ext-ctl", ":9090"]
