project_id                   = "trinnex-service"
region                       = "us-central1"
cluster_name                 = "avi-autopilot-private-auth01"
network_name                 = "shared-net"
subnet_name                  = "us-central1"
pods_range_name              = "pod"
svc_range_name               = "service"
maintenance_start_time       = "2022-10-07T00:00:00Z"
maintenance_end_time         = "2022-10-07T05:00:00Z"
maintenance_recurrence	     = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH"
network_project_id           = "trinnex-host1"


master_authorized_networks=[
    {
      cidr_block   = "10.60.0.0/17"
      display_name = "VPC"
    },
  ]
