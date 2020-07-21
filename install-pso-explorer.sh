#!/bin/bash
# 
# Script to install PSO Explorer
# See: https://github.com/PureStorage-OpenConnect/pso-explorer

helm repo add pso-explorer 'https://raw.githubusercontent.com/PureStorage-OpenConnect/pso-explorer/master/'
helm repo update
helm search repo pso-explorer

kubectl create namespace psox
helm install pso-explorer pso-explorer/pso-explorer --namespace psox