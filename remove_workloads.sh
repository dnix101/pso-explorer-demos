#!/bin/bash

# Remove snapshots for Wordpress
kubectl delete volumesnapshot --all -n wordpress-1
kubectl delete volumesnapshot --all -n wordpress-2
kubectl delete volumesnapshot --all -n wordpress-3
kubectl delete volumesnapshot --all -n wordpress-4

# Remove snapshots for workbench
kubectl delete volumesnapshot --all -n fio-1
kubectl delete volumesnapshot --all -n fio-2

# Uninstall Wordpress applications
helm uninstall wordpress -n wordpress-1
kubectl delete pvc --all -n wordpress-1
kubectl delete namespace wordpress-1

helm uninstall wordpress -n wordpress-2
kubectl delete pvc --all -n wordpress-2
kubectl delete namespace wordpress-2

helm uninstall wordpress -n wordpress-3
kubectl delete pvc --all -n wordpress-3
kubectl delete namespace wordpress-3

helm uninstall wordpress -n wordpress-4
kubectl delete pvc --all -n wordpress-4
kubectl delete namespace wordpress-4

# Remove workbench jobs and volumes
kubectl delete -f fio/fio-block.yaml -n fio-1
kubectl delete namespace fio-1

kubectl delete -f fio/fio-block.yaml -n fio-2
kubectl delete namespace fio-2

kubectl delete -f fio/fio-file.yaml -n fio-3
kubectl delete namespace fio-3

# Remove Elastic Search
kubectl delete volumesnapshot --all -n elastic
kubectl patch pvc elasticsearch-data-quickstart-es-default-0 -p '{"metadata":{"finalizers":null}}' -n elastic
kubectl delete -f elastic/elastic.yaml -n elastic
kubectl delete -f elastic/all-in-one.yaml
kubectl delete namespace elastic
