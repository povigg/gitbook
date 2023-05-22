---
description: >-
  Helps to manage containerized apps in different deoployment environments (e.g.
  physical, virtual, cloud)
---

# Kubernetes

### Features

* High availability or no downtime
* Scalability, high performance
* Disaster recovery - backup and restore



### K8s components

Pod

* Smallest unit of K8s
* Abstraction over container
* Usually 1 app per pod
* Each pod gets its own IP (new IP everytime Pod is recreated)

Service

* Permanent IP
* Lifecycle of Pod and Service is NOT connected

Ingress

* An API object that manages external access to the services in a cluster, typically HTTP
*
