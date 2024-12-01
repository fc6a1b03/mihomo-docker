FROM scratch
COPY mihomo .
EXPOSE 9090
CMD ["/mihomo", "-d", "data", "-f", "data/config.yaml", "-ext-ctl", ":9090"]
