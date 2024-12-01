[mihomo](https://github.com/MetaCubeX/mihomo/tree/Alpha)

### 使用说明
- 运行`docker run -d -p 9090:9090 -p 7890:7890 -v /data/:/opt/mihomo/data ghcr.io/fc6a1b03/mihomo-docker:latest`
- 数据目录位置`/opt/mihomo/data`，可选择`-v /data/:/opt/mihomo/data`
- 配置文件`config.yaml`放置在`data`目录下，可选择`-v config.yaml:/opt/mihomo/data/config.yaml`
- 端口
  - RESTful`9090`
  - PROXY`7890`
- use
  ```bash
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    export all_proxy="socks5://127.0.0.1:7890"
    curl -I https://www.google.com.hk/
  ```
