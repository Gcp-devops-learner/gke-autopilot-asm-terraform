/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */



data "google_client_config" "default" {}
data "google_project" "project" {
  project_id = var.project_id
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

# module "project-services" {
#   source  = "terraform-google-modules/project-factory/google//modules/project_services"
#   version = "~> 13.0"
#   project_id    = var.project_id
#   activate_apis = var.activate_apis
# }

module "gke" {
  source                          = "terraform-google-modules/kubernetes-engine/google//modules/beta-autopilot-private-cluster"
  project_id                      = var.project_id
  name                            = var.cluster_name
  regional                        = true
  region                          = var.region
  network                         = var.network_name
  subnetwork                      = var.subnet_name
  ip_range_pods                   = var.pods_range_name
  ip_range_services               = var.svc_range_name
  release_channel                 = "REGULAR"
  maintenance_start_time          = var.maintenance_start_time
  maintenance_end_time            = var.maintenance_end_time
  maintenance_recurrence	        = var.maintenance_recurrence
  enable_vertical_pod_autoscaling = true
  enable_private_endpoint         = true
  enable_private_nodes            = true
  master_ipv4_cidr_block          = "172.10.0.0/28"
  master_authorized_networks = var.master_authorized_networks
  deploy_using_private_endpoint = true
  cluster_resource_labels = { "mesh_id" : "proj-${data.google_project.project.number}" }
  identity_namespace      = "${var.project_id}.svc.id.goog"
  network_project_id     = var.network_project_id

  
}

module "asm" {
  source                    = "terraform-google-modules/kubernetes-engine/google//modules/asm"
  project_id                = var.project_id
  cluster_name              = module.gke.name
  cluster_location          = module.gke.location
  multicluster_mode         = "connected"
  enable_cni                = true
  internal_ip               = true
  enable_mesh_feature       = true
  enable_fleet_registration = true
}