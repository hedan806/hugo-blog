---
title: "Elasticsearch 6.1.4 upgrade to 7.4.0"
date: 2019-10-09T14:18:00+08:00
draft: true
---

[TOC]

# 1. 集群改动

## 1. Zen Discovery 改动

![](http://img.honlyc.com/20191009155635.png)

不再有``discovery.zen.minimum_master_nodes``这个控制集群脑裂的配置，转而由集群自主控制，并且新版在启动一个新的集群的时候需要有``cluster.initial_master_nodes``初始化集群列表。

```yml
discovery.seed_hosts: ["10.20.5.39:9201","10.20.5.39:9400"]
cluster.initial_master_nodes: ["10.20.5.39:9201"]
```

``discovery.seed_hosts``：7.x版本新增参数，写入候选主节点的设备地址，来开启服务时就可以被选为主节点，由``discovery.zen.ping.unicast.hosts``参数改变而来。

``cluster.initial_master_nodes``： 7.x版本新增参数，写入候选主节点的设备地址，来开启服务时就可以被选为主节点。


# 2. 插件改动

## 1. IndexStore 和 DirectoryService 被移除

PR: [Remove IndexStore and DirectoryService](https://github.com/elastic/elasticsearch/pull/42446)

主要修改：

1. 移除所有``IndexStore``类，将继承``FsDirectoryService``的类换成实现``IndexStorePlugin.DirectoryFactory``接口。

## 2. ``slf4j-log4j12``包依赖问题

由于``Hdfs``模块内，依赖了``slf4j-log4j12``，但是内部包有冲突，需要排除后，手动依赖一个指定版本。

此时，会报

```bash
java.security.AccessControlException: access denied ("jaCustomva.lang.RuntimePermission" "createSecurityManager")
```

错误，具体原因并未找到。

解决办法为：排除冲突包，依赖指定版本：

```xml
<dependency>
			<artifactId>slf4j-log4j12</artifactId>
			<groupId>org.slf4j</groupId>
			<version>1.7.10</version>
		</dependency>
```

# 3. 参数调整（优化）

## 1. 慢查询超时设置

默认查询的超时是``-1``，即不超时。超时设置使用：

```json
PUT _cluster/settings
{
   "transient": {"search.default_search_timeout":"250s"}
}
```

