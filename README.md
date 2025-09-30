# proxy-dock

基于 Docker Compose 搭建的静态代理服务环境

# IP地址

内部IP地址从 172.25.27.3 开始

# 服务清单

| 状态 | service | backend ip | version | 备注 |
|---|---|---|---|---|
| [&check;] | nginx | 172.25.27.3 | 1.27 | |
| [&check;] | apache | 172.25.27.4 | 2.4 | |
| [&check;] | caddy | 172.25.27.5 | 2.9 | |
| [&check;] | traefik | 172.25.27.6 | latest | |

# 使用到的镜像

```json
[
    "",
]
```
