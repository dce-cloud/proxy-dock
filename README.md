# bigdata-dock

基于 Docker Compose 搭建的大数据服务环境

# IP地址
内部IP地址从 172.25.27.3 开始

## Proxy (静态代理服务) 
172.21.5.3 start

| 状态 | service | backend ip | frontend ip | version | 备注 |
|---|---|---|---|---|---|
| [&check;] | nginx | 172.21.5.3 | 172.20.5.3 | 1.27 | |
| [&check;] | apache | 172.21.5.4 | 172.20.5.4 | 2.4 | |
| [&check;] | caddy | 172.21.5.5 | 172.20.5.5 | 2.9 | |
| [&cross;] | traefik | 172.21.5.6 | 172.20.5.6 | latest | |


# 使用到的镜像
- 默认使用docker.io 镜像
- 若想使用自定义仓库镜像，需要定义 `DOCKER_REGISTRY_URL` 变量

```json
[
    "traefik:v3.4",
]
```
