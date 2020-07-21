#!/bin/bash

kubectl apply -f snapshot-beta/snapshotclass.yaml
kubectl apply -f snapshot-beta/snapshot.yaml -n wordpress-1
kubectl apply -f snapshot-beta/snapshot.yaml -n wordpress-2
kubectl apply -f snapshot-beta/snapshot.yaml -n wordpress-3
kubectl apply -f snapshot-beta/snapshot.yaml -n wordpress-4
kubectl apply -f snapshot-beta/snapshot-fio.yaml -n fio-1
kubectl apply -f snapshot-beta/snapshot-fio.yaml -n fio-2
