#!/bin/bash

helm uninstall pure-storage-driver -n pure-csi
kubectl delete namespace pure-csi
helm uninstall pso-analytics -n pso-analytics
kubectl delete namespace pso-analytics
