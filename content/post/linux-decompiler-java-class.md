---
title: "Linux Decompiler Java Class"
date: 2020-08-19T10:01:49+08:00
draft: true
tags: ["linux"]
categories: ["java"]
---

# 场景

有时候，我们需要在服务器上看对应类是否有修改，或者代码是否正确，就需要在服务器上进行反编译了。这里，介绍一个常用的``class``反编译工具：``CRF``.

# 下载

http://www.benf.org/other/cfr/

直接下载最新版本，我这里是``https://www.benf.org/other/cfr/cfr-0.150.jar``。

# 使用

首先，我们需要把``jar``包进行解压：

```bash
jar -xf *.jar
```

然后进入到需要反编译的``class``目录下，执行反编译：

```bash
java -jar cfr-0.150.jar ./*.class
```

就可以直接看到反编译的结果啦。

