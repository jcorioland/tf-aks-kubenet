#!/bin/bash

set -e

echo "Configuring network..."

echo "Retrieving AKS resource group, route table and network sucurity group..."
AKS_MC_RG=$(az group list --query "[?starts_with(name, 'MC_${AKS_RG}')].name | [0]" --output tsv)

echo "Resource group: ".$AKS_MC_RG

AKS_ROUTE_TABLE=$(az network route-table list -g ${AKS_MC_RG} --query "[].id | [0]" -o tsv)
AKS_NODE_SUBNET_ID=$(az network vnet subnet show -g ${AKS_VNET_RG} --name ${AKS_SUBNET_NAME} --vnet-name ${AKS_VNET_NAME} --query id -o tsv)
AKS_NODE_NSG=$(az network nsg list -g ${AKS_MC_RG} --query "[].id | [0]" -o tsv)

echo "Updating VNET..."
echo "Route table: ".$AKS_ROUTE_TABLE.",  Network Security Group:".$AKS_NODE_NSG.", Subnet ID:".$AKS_NODE_SUBNET_ID

az network vnet subnet update \
--route-table $AKS_ROUTE_TABLE \
--network-security-group $AKS_NODE_NSG \
--ids $AKS_NODE_SUBNET_ID

echo "Network has been successfuly configured."