#!/bin/bash

set -e

echo "Cleaning network configuration..."

AKS_NODE_SUBNET_ID=$(az network vnet subnet show -g ${AKS_VNET_RG} --name ${AKS_SUBNET_NAME} --vnet-name ${AKS_VNET_NAME} --query id -o tsv)

az network vnet subnet update \
--route-table "" \
--network-security-group "" \
--ids $AKS_NODE_SUBNET_ID

echo "Network configuration has been successfuly cleaned."