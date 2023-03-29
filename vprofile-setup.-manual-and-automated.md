# Vprofile setup. Manual and automated

<figure><img src=".gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

### Overview:

* User opens the browser and enter URL (IP in this case) of load balancer
* Nginx will be used to create load balancer experience wich will route user to Apache Tomcat service
* Apache Tomcat is a **JAVA web application** **service.** (Tomcat is a popular service to host java web apps) NFS can be used for an external storage
* RabbitMQ is a queing agent (you can stream data from it)
* M (Memcached) is conencted to MySQL Server. When first request comes to MySQL, it sends data back to Tomcat, but at the same time it caches it to Memcached so the next time the same request comes it will access the cached data

### VM Setup

Will be using Vagrant to automate VMs which will run services

<figure><img src=".gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>

### Workflow

* Create VMs using Vagrant
* validate and bring uo VMs
* Setup all services
  * MySQL
  * Memcached
  * RabbitMQ
  * Tomcat
  * Nginx
* Build JAVA app and deploy
* Verify from browser
