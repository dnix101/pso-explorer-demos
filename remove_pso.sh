#!/bin/bash

helm uninstall pure-storage-driver -n pure-csi
kubectl delete namespace pure-csi
helm uninstall pso-explorer -n psox
kubectl delete namespace psox