
# Terraform Private Autopilot Kubernetes cluster with ASM  

This script provision a Private Autopilot cluster with no public access to Control plane. Anthos service mesh is also enabled for the GKE cluster. 



## Private Cluster Details
For details on configuring private clusters with this module, check the [troubleshooting guide](https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/blob/master/docs/private_clusters.md).



<!-- do not understand what this is about -->
Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


### Configure a Service Account
In order to execute this module you must have a Service Account with the
following project roles:
- roles/compute.viewer
- roles/compute.securityAdmin (only required if `add_cluster_firewall_rules` is set to `true`)
- roles/container.clusterAdmin
- roles/container.developer
- roles/iam.serviceAccountAdmin
- roles/iam.serviceAccountUser
- roles/resourcemanager.projectIamAdmin 

### Creating a cluster in shared VPC
Google Kubernetes Engine service account should be assigned the Kubernetes Engine Service Agent role on your host Project  
`service-PROJECT_NUMBER@container-engine-robot.iam.gserviceaccount.com`

### Enable APIs
In order to operate with the Service Account you must activate the following APIs on the project where the Service Account was created:
- Cloud Resource Manager API - cloudresourcemanager.googleapis.com
- Compute Engine API - compute.googleapis.com
- Kubernetes Engine API - container.googleapis.com
- Mesh Confuiguration API -  meshconfig.googleapis.com 
- GKE Hub API - gkehub.googleapis.com
