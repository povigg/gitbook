---
description: >-
  Helps to manage containerized apps in different deoployment environments (e.g.
  physical, virtual, cloud)
---

# Kubernetes

### Documentation

[https://kubernetes.io/docs/home/](https://kubernetes.io/docs/home/)

### Features

* High availability or no downtime
* Scalability, high performance
* Disaster recovery - backup and restore



### K8s components

<figure><img src=".gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

Pod

* Smallest unit of K8s
* Abstraction over container
* Usually 1 app per pod
* Each pod gets its own IP (new IP everytime Pod is recreated)

Service

* Permanent IP
* Lifecycle of Pod and Service is NOT connected
* Load-balancer

Ingress

* An API object that manages external access to the services in a cluster, typically HTTP

### Deployment

* Used for **stateLESS** Apps

### StatefulSet

* Used for **stateFUL** Apps or DBs

### K8s Architecture

<figure><img src=".gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

### Namespace

Provides a mechanism for isolating groups of resources within a single cluste

* **default**: used to create resources if new name space is not created
* **kube-node-lease**: contains heartbeats of nodes, each node has associated lease object
* **kube-public:** publicely accessible data, contains cluster info
* **kube-system**: objects/processes created by K8s. Not for use!

Persistent volume and node **cannot** be created within namespace

