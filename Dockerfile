FROM alpine AS builder
WORKDIR /opt/mihomo
RUN apk add --no-cache tzdata
RUN mkdir -p /opt/mihomo/data
COPY mihomo .
RUN chmod +x mihomo

# ============================================================

FROM scratch
COPY mihomo .
COPY --from=builder /opt/mihomo mihomo
COPY --from=builder /usr/share/zoneinfo/Asia/Shanghai /usr/share/zoneinfo/Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone
EXPOSE 9090
CMD ["/opt/mihomo/mihomo", "-d", "data", "-f", "data/config.yaml", "-ext-ctl", ":9090"]
