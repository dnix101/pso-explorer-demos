#!/bin/bash

helm repo add pure https://purestorage.github.io/helm-charts
helm repo update
helm search repo pure-csi

kubectl create namespace pure-csi
helm install pure-storage-driver pure/pure-csi --namespace pure-csi -f values-good.yaml
