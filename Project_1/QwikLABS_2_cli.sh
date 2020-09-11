#!/bin/bash
gcloud compute instances create "my-vm-1" --zone=us-central1-a --machine-type "n1-standard-1" --image-project "debian-cloud" --image "debian-9-stretch-v20190213" --subnet "default"

gcloud compute  firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0

# second vm
gcloud config set compute/zone us-central1-b
gcloud compute instances create "my-vm-2" \
--machine-type "n1-standard-1" \
--image-project "debian-cloud" \
--image "debian-9-stretch-v20190213" \
--subnet "default"

gcloud compute ssh my-vm-2
ping my-vm-1
exit
gcloud compute ssh my-vm-1
ping my-vm-2
sudo apt-get install nginx-light -y
sudo nano /var/www/html/index.nginx-debian.html
curl http://localhost/
exit
gcloud compute ssh my-vm-2
curl http://my-vm-1/