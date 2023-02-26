# Vagrant

<figure><img src=".gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

Vagrant images: [https://app.vagrantup.com/boxes/search](https://app.vagrantup.com/boxes/search)

* vagrant init - create vagr ant file
* vagrant up - start vm
* vagrant halt - stop vm
* vagrant ssh - ssh to vm
* vagrant destroy - delete vm

## Vagrant File

config.vm.network "private\_network", ip: "192.168.33.10" - to set static IP

config.vm.network "public\_network" - dynamic IP (bridged adaptor)

config cpu, memory:

```ruby
config.vm.provider "virtualbox" do |v|
  v.memory = 1024
  v.cpus = 2
end
```

Sync directories: first location is on your local device, second on linux device

`config.vm.synced_folder "D:\shells_scripts", "/vagrant_data"`

<figure><img src=".gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

### Website setup with html template

* install services such as httpd, wget, unzip
* /var/www/html/index.html - file to replace  default httpd website
* download website template and unzip it ([https://www.tooplate.com](https://www.tooplate.com) for templates)
* copy all od the content to replace default html: cp -r \* /var/www/html/
* systemctl restart httpd
