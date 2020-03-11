# emr-base
艾佳生活提供的大数据一站式镜像

# emr-base

[emr-base](https://www.ihomefnt.com) 的 docker 镜像: [ihomefnt/emr-base](https://hub.docker.com/repository/docker/ihomefnt/emr-base/general)

## 引导

### 独立镜像方式

> 这里介绍下手动通过Dockerfile文件进行构建如下：

1、 克隆项目

```
clone https://github.com/kuaiwenwu/emr-base.git
```

> 以下步骤进入 `cd emr-base` 目录。

2、 手动构建镜像 （可以对其中组件的版本变更为指定的版本号，确保连接可用）

```
docker build -t emr-base:<tagname> .
```


3、 启动

```
docker run itd  ihomefnt/emr-base
```

> `docker exec`进入容器中 测试 各个组件环境变量正常即可。

4、 测试

```
docker exec -it <dockerId> printenv
```
