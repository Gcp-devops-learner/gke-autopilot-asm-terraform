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

variable "project_id" {
  description = "The project ID to host the cluster in"
   type        = string
}

variable "region" {
  description = "The region the cluster in"
  default     = "us-central1"
   type        = string
}

variable "cluster_name" {
  description = "The name of the cluster (required)"
   type        = string
  default     = "gke-autopilot-private-1"

}

variable "network_name" {
  description = "The VPC network to host the cluster in (required)"
  type        = string
  default     = ""

}
variable "subnet_name" {
  description = "The subnetwork to host the cluster in (required)"
  type        = string
  default     = ""

}
variable "pods_range_name" {
  description = "The name of the secondary subnet ip range to use for pods"
  default     = "gke-autopilot-private-1"
  type        = string

}
variable "svc_range_name" {
  description = "The name of the secondary subnet range to use for services"
  default     = "gke-autopilot-private-1"
  type        = string

}
variable "master_authorized_networks" {
   description =  "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
   type = list(object({ cidr_block = string, display_name = string }))
   default = []
} 

variable "maintenance_start_time" {
    description = "Time window specified for daily or recurring maintenance operations in RFC3339 format"
    type =string
}

variable "maintenance_end_time" {
    description = "Time window specified for recurring maintenance operations in RFC3339 format"
    type =string
}

variable "maintenance_recurrence" {
    description = "Frequency of the recurring maintenance window in RFC5545 format"
    type =string
}