#!/bin/bash

set -e

echo "Getting AKS credentials..."
az aks get-credentials -n $AKS_NAME -g $AKS_RG

echo "Creating service account and cluster role binding for Tiller..."
kubectl create serviceaccount -n kube-system tiller
kubectl create clusterrolebinding tiller --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

echo "Initializing Helm..."
helm init --service-account tiller

echo "Helm has been installed."