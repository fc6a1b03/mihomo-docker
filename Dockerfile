FROM alpine AS builder
WORKDIR /opt/mihomo
RUN apk add --no-cache tzdata
RUN mkdir -p /opt/mihomo/data
COPY mihomo .
RUN chmod +x mihomo

# ============================================================

FROM scratch
COPY --from=builder /opt/mihomo mihomo
EXPOSE 9090
CMD ["/opt/mihomo/mihomo", "-d", "data", "-f", "data/config.yaml", "-ext-ctl", ":9090"]
