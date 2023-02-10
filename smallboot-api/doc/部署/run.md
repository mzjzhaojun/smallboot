# 环境部署

> 组件环境部署可参考 https://gitee.com/zhengqingya/docker-compose

```shell
# portainer
docker run -d -p 9000:9000 --restart=always --name portainer -v /var/run/docker.sock:/var/run/docker.sock registry.cn-hangzhou.aliyuncs.com/zhengqing/portainer-ce:2.16.2


# 当前目录下所有文件赋予权限(读、写、执行)
chmod -R 777 ./redis

# 组件部署
docker-compose -f ./docker-compose.yml -p smallboot up -d mysql redis minio

# 服务部署 -- 根据自己的条件去启动
docker-compose -p smallboot up -d api
docker-compose -p smallboot up -d web
```

---

### Redis

```shell
# 连接redis
docker exec -it redis redis-cli -a 123456
```
