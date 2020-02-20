---
title: "Centos Init"
date: 2020-02-20T14:58:46+08:00
draft: true
---

# Docker

## Step1: Update

```bash
sudo yum check-update
```

## Step2: Install the Dependencies

```bash
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

## Step3: Add the Docker Repository to CentOS

```bash
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

## Step4: Install Docker

```bash
sudo yum install docker
```

## Step5: Install Docker-compose


