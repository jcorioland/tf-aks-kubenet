# Deploy AKS in custom VNET, with Kubenet plugin using Terraform

This repository contains all you need to use Terraform to deploy Azure Kubernetes Service with Kubenet plugin, inside a custom VNET.

It automatically creates:

* A resource group
* A virtual network with an address space of `10.1.0.0/16`
* A subnet named `internal` with an address range of `10.1.0.0/24` (where the AKS worker nodes will land)
* An Azure Kubernetes Service cluster

## How it works

All the AKS cluster definition is in the `tf/aks.tf` file. Some of the parameters are variable that can be overriden in the `tf/variables.tf` file.

## How to deploy

You need to have Terraform installed and Azure CLI 2.0 installed, obviously.

Go to the `tf` directory:

```bash
cd tf
```

*Optional: update the `variables.tf` and `aks.tf` files with desired values.*

Export the following environment variables for the service principal client id and client secret that should be used by the Azure Kubernetes Service cluster:

```bash
export TF_VAR_client_secret=YOUR_CLIENT_SECRET
export TF_VAR_client_id=YOUR_CLIENT_ID
```

Initialize Terraform

```bash
terraform init
```

Plan the deployment:

```bash
terraform plan -out out.plan
```

Apply the plan to start the deployment:

```bash
terraform apply "out.plan"
```

Wait for the deployment to be completed.

## How to destroy

Go to the `tf` directory:

```bash
cd tf
```

Call Terraform destroy:

```bash
terraform destroy
```