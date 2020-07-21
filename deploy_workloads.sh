#!/bin/bash

# Deploy Elastic search All In One config
# See: https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-quickstart.html
kubectl apply -f elastic/all-in-one.yaml

# Add Bitname Helm repo
# See: https://bitnami.com/stack/wordpress/helm
helm repo add bitnami https://charts.bitnami.com/bitnami

# Deploy four Wordpress instances
# See: https://bitnami.com/stack/wordpress/helm
# Username: pureuser
# Password: pureuser
kubectl create namespace wordpress-1
helm install wordpress bitnami/wordpress --set wordpressUsername=pureuser,wordpressPassword=pureuser,global.storageClass=pure-block -n wordpress-1

kubectl create namespace wordpress-2
helm install wordpress bitnami/wordpress --set wordpressUsername=pureuser,wordpressPassword=pureuser,global.storageClass=pure-block -n wordpress-2

kubectl create namespace wordpress-3
helm install wordpress bitnami/wordpress --set wordpressUsername=pureuser,wordpressPassword=pureuser,global.storageClass=pure-block -n wordpress-3

kubectl create namespace wordpress-4
helm install wordpress bitnami/wordpress --set wordpressUsername=pureuser,wordpressPassword=pureuser,global.storageClass=pure-block -n wordpress-4

# Deploy two workbenches
# If not using FlashArray remove fio-1 and fio-2
# If not using FlashBlade remove fio-3
kubectl create namespace fio-1
kubectl apply -f fio/fio-block.yaml -n fio-1
kubectl create namespace fio-2
kubectl apply -f fio/fio-block.yaml -n fio-2
kubectl create namespace fio-3
kubectl apply -f fio/fio-file.yaml -n fio-3

# Deploy multinode elastic search application
# See: https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-quickstart.html
kubectl create namespace elastic
kubectl apply -f elastic/elastic.yaml -n elastic
