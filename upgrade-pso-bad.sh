#!/bin/bash

helm upgrade pure-storage-driver pure/pure-csi --namespace pure-csi -f values-bad.yaml
