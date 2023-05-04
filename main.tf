terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">=0.89.0"
    }
  }
}

resource "yandex_kubernetes_cluster" "this" {
  name        = var.name
  description = var.description
  network_id  = var.network_id

  master {
    version = var.k8s_version
    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }

    public_ip = true

    # security_group_ids = ["${yandex_vpc_security_group.security_group_name.id}"]

    maintenance_policy {
      auto_upgrade = true

      maintenance_window {
        start_time = "15:00"
        duration   = "3h"
      }
    }

    # master_logging {
    #   enabled = true
    #   log_group_id = "${yandex_logging_group.log_group_resoruce_name.id}"
    #   kube_apiserver_enabled = true
    #   cluster_autoscaler_enabled = true
    #   events_enabled = true
    # }
  }

  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id

  labels = {
    my_key       = "my_value"
    my_other_key = "my_other_value"
  }

  release_channel = "RAPID"
  network_policy_provider = "CALICO"

  # kms_provider {
  #   key_id = "${yandex_kms_symmetric_key.kms_key_resource_name.id}"
  # }
}
