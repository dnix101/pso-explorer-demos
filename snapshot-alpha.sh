#!/bin/bash

kubectl apply -f snapshot-alpha/snapshotclass.yaml
kubectl apply -f snapshot-alpha/snapshot.yaml -n wordpress-1
kubectl apply -f snapshot-alpha/snapshot.yaml -n wordpress-2
kubectl apply -f snapshot-alpha/snapshot.yaml -n wordpress-3
kubectl apply -f snapshot-alpha/snapshot.yaml -n wordpress-4
kubectl apply -f snapshot-alpha/snapshot-fio.yaml -n fio-1
kubectl apply -f snapshot-alpha/snapshot-fio.yaml -n fio-2
