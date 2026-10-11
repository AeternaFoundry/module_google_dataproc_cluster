variable "dataproc_clusters" {
  description = <<EOT
Map of dataproc_clusters, attributes below
Required:
    - name
Optional:
    - deletion_policy
    - graceful_decommission_timeout
    - labels
    - project
    - region
    - cluster_config (block):
        - autoscaling_config (optional, block):
            - policy_uri (required)
        - auxiliary_node_groups (optional, block):
            - node_group (required, block):
                - node_group_config (optional, block):
                    - accelerators (optional, block):
                        - accelerator_count (required)
                        - accelerator_type (required)
                    - disk_config (optional, block):
                        - boot_disk_provisioned_iops (optional)
                        - boot_disk_provisioned_throughput (optional)
                        - boot_disk_size_gb (optional)
                        - boot_disk_type (optional)
                        - local_ssd_interface (optional)
                        - num_local_ssds (optional)
                    - machine_type (optional)
                    - min_cpu_platform (optional)
                    - num_instances (optional)
                - roles (required)
            - node_group_id (optional)
        - cluster_tier (optional)
        - cluster_type (optional)
        - dataproc_metric_config (optional, block):
            - metrics (required, block):
                - metric_overrides (optional)
                - metric_source (required)
        - encryption_config (optional, block):
            - kms_key_name (required)
        - endpoint_config (optional, block):
            - enable_http_port_access (required)
        - engine (optional)
        - gce_cluster_config (optional, block):
            - confidential_instance_config (optional, block):
                - confidential_instance_type (optional)
                - enable_confidential_compute (optional)
            - internal_ip_only (optional)
            - metadata (optional)
            - network (optional)
            - node_group_affinity (optional, block):
                - node_group_uri (required)
            - reservation_affinity (optional, block):
                - consume_reservation_type (optional)
                - key (optional)
                - values (optional)
            - resource_manager_tags (optional)
            - service_account (optional)
            - service_account_scopes (optional)
            - shielded_instance_config (optional, block):
                - enable_integrity_monitoring (optional)
                - enable_secure_boot (optional)
                - enable_vtpm (optional)
            - subnetwork (optional)
            - tags (optional)
            - zone (optional)
        - initialization_action (optional, block):
            - script (required)
            - timeout_sec (optional)
        - lifecycle_config (optional, block):
            - auto_delete_time (optional)
            - auto_stop_time (optional)
            - idle_delete_ttl (optional)
            - idle_stop_ttl (optional)
        - master_config (optional, block):
            - accelerators (optional, block):
                - accelerator_count (required)
                - accelerator_type (required)
            - disk_config (optional, block):
                - attached_disk_config (optional, block):
                    - disk_size_gb (optional)
                    - disk_type (optional)
                    - provisioned_iops (optional)
                    - provisioned_throughput (optional)
                - boot_disk_provisioned_iops (optional)
                - boot_disk_provisioned_throughput (optional)
                - boot_disk_size_gb (optional)
                - boot_disk_type (optional)
                - local_ssd_interface (optional)
                - num_local_ssds (optional)
            - image_uri (optional)
            - instance_flexibility_policy (optional, block):
                - instance_selection_list (optional, block):
                    - disk_config (optional, block):
                        - attached_disk_config (optional, block):
                            - disk_size_gb (optional)
                            - disk_type (optional)
                            - provisioned_iops (optional)
                            - provisioned_throughput (optional)
                        - boot_disk_provisioned_iops (optional)
                        - boot_disk_provisioned_throughput (optional)
                        - boot_disk_size_gb (optional)
                        - boot_disk_type (optional)
                        - local_ssd_interface (optional)
                        - num_local_ssds (optional)
                    - machine_types (optional)
                    - rank (optional)
            - machine_type (optional)
            - min_cpu_platform (optional)
            - num_instances (optional)
        - metastore_config (optional, block):
            - dataproc_metastore_service (required)
        - preemptible_worker_config (optional, block):
            - disk_config (optional, block):
                - attached_disk_config (optional, block):
                    - disk_size_gb (optional)
                    - disk_type (optional)
                    - provisioned_iops (optional)
                    - provisioned_throughput (optional)
                - boot_disk_provisioned_iops (optional)
                - boot_disk_provisioned_throughput (optional)
                - boot_disk_size_gb (optional)
                - boot_disk_type (optional)
                - local_ssd_interface (optional)
                - num_local_ssds (optional)
            - instance_flexibility_policy (optional, block):
                - instance_selection_list (optional, block):
                    - disk_config (optional, block):
                        - attached_disk_config (optional, block):
                            - disk_size_gb (optional)
                            - disk_type (optional)
                            - provisioned_iops (optional)
                            - provisioned_throughput (optional)
                        - boot_disk_provisioned_iops (optional)
                        - boot_disk_provisioned_throughput (optional)
                        - boot_disk_size_gb (optional)
                        - boot_disk_type (optional)
                        - local_ssd_interface (optional)
                        - num_local_ssds (optional)
                    - machine_types (optional)
                    - rank (optional)
                - provisioning_model_mix (optional, block):
                    - standard_capacity_base (optional)
                    - standard_capacity_percent_above_base (optional)
            - num_instances (optional)
            - preemptibility (optional)
        - security_config (optional, block):
            - identity_config (optional, block):
                - user_service_account_mapping (required)
            - kerberos_config (optional, block):
                - cross_realm_trust_admin_server (optional)
                - cross_realm_trust_kdc (optional)
                - cross_realm_trust_realm (optional)
                - cross_realm_trust_shared_password_uri (optional)
                - enable_kerberos (optional)
                - kdc_db_key_uri (optional)
                - key_password_uri (optional)
                - keystore_password_uri (optional)
                - keystore_uri (optional)
                - kms_key_uri (required)
                - realm (optional)
                - root_principal_password_uri (required)
                - tgt_lifetime_hours (optional)
                - truststore_password_uri (optional)
                - truststore_uri (optional)
        - software_config (optional, block):
            - image_version (optional)
            - optional_components (optional)
            - override_properties (optional)
        - staging_bucket (optional)
        - temp_bucket (optional)
        - worker_config (optional, block):
            - accelerators (optional, block):
                - accelerator_count (required)
                - accelerator_type (required)
            - disk_config (optional, block):
                - attached_disk_config (optional, block):
                    - disk_size_gb (optional)
                    - disk_type (optional)
                    - provisioned_iops (optional)
                    - provisioned_throughput (optional)
                - boot_disk_provisioned_iops (optional)
                - boot_disk_provisioned_throughput (optional)
                - boot_disk_size_gb (optional)
                - boot_disk_type (optional)
                - local_ssd_interface (optional)
                - num_local_ssds (optional)
            - image_uri (optional)
            - instance_flexibility_policy (optional, block):
                - instance_selection_list (optional, block):
                    - disk_config (optional, block):
                        - attached_disk_config (optional, block):
                            - disk_size_gb (optional)
                            - disk_type (optional)
                            - provisioned_iops (optional)
                            - provisioned_throughput (optional)
                        - boot_disk_provisioned_iops (optional)
                        - boot_disk_provisioned_throughput (optional)
                        - boot_disk_size_gb (optional)
                        - boot_disk_type (optional)
                        - local_ssd_interface (optional)
                        - num_local_ssds (optional)
                    - machine_types (optional)
                    - rank (optional)
            - machine_type (optional)
            - min_cpu_platform (optional)
            - min_num_instances (optional)
            - num_instances (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - virtual_cluster_config (block):
        - auxiliary_services_config (optional, block):
            - metastore_config (optional, block):
                - dataproc_metastore_service (optional)
            - spark_history_server_config (optional, block):
                - dataproc_cluster (optional)
        - kubernetes_cluster_config (optional, block):
            - gke_cluster_config (required, block):
                - gke_cluster_target (optional)
                - node_pool_target (optional, block):
                    - node_pool (required)
                    - node_pool_config (optional, block):
                        - autoscaling (optional, block):
                            - max_node_count (optional)
                            - min_node_count (optional)
                        - config (optional, block):
                            - local_ssd_count (optional)
                            - machine_type (optional)
                            - min_cpu_platform (optional)
                            - preemptible (optional)
                            - spot (optional)
                        - locations (required)
                    - roles (required)
            - kubernetes_namespace (optional)
            - kubernetes_software_config (required, block):
                - component_version (required)
                - properties (optional)
        - staging_bucket (optional)
EOT

  type = map(object({
    name                          = string
    deletion_policy               = optional(string)
    graceful_decommission_timeout = optional(string)
    labels                        = optional(map(string))
    project                       = optional(string)
    region                        = optional(string)
    cluster_config = optional(object({
      autoscaling_config = optional(object({
        policy_uri = string
      }))
      auxiliary_node_groups = optional(list(object({
        node_group = list(object({
          node_group_config = optional(object({
            accelerators = optional(list(object({
              accelerator_count = number
              accelerator_type  = string
            })))
            disk_config = optional(object({
              boot_disk_provisioned_iops       = optional(number)
              boot_disk_provisioned_throughput = optional(number)
              boot_disk_size_gb                = optional(number)
              boot_disk_type                   = optional(string)
              local_ssd_interface              = optional(string)
              num_local_ssds                   = optional(number)
            }))
            machine_type     = optional(string)
            min_cpu_platform = optional(string)
            num_instances    = optional(number)
          }))
          roles = list(string)
        }))
        node_group_id = optional(string)
      })))
      cluster_tier = optional(string)
      cluster_type = optional(string)
      dataproc_metric_config = optional(object({
        metrics = list(object({
          metric_overrides = optional(set(string))
          metric_source    = string
        }))
      }))
      encryption_config = optional(object({
        kms_key_name = string
      }))
      endpoint_config = optional(object({
        enable_http_port_access = bool
      }))
      engine = optional(string)
      gce_cluster_config = optional(object({
        confidential_instance_config = optional(object({
          confidential_instance_type  = optional(string)
          enable_confidential_compute = optional(bool)
        }))
        internal_ip_only = optional(bool)
        metadata         = optional(map(string))
        network          = optional(string)
        node_group_affinity = optional(object({
          node_group_uri = string
        }))
        reservation_affinity = optional(object({
          consume_reservation_type = optional(string)
          key                      = optional(string)
          values                   = optional(set(string))
        }))
        resource_manager_tags  = optional(map(string))
        service_account        = optional(string)
        service_account_scopes = optional(set(string))
        shielded_instance_config = optional(object({
          enable_integrity_monitoring = optional(bool)
          enable_secure_boot          = optional(bool)
          enable_vtpm                 = optional(bool)
        }))
        subnetwork = optional(string)
        tags       = optional(set(string))
        zone       = optional(string)
      }))
      initialization_action = optional(list(object({
        script      = string
        timeout_sec = optional(number)
      })))
      lifecycle_config = optional(object({
        auto_delete_time = optional(string)
        auto_stop_time   = optional(string)
        idle_delete_ttl  = optional(string)
        idle_stop_ttl    = optional(string)
      }))
      master_config = optional(object({
        accelerators = optional(list(object({
          accelerator_count = number
          accelerator_type  = string
        })))
        disk_config = optional(object({
          attached_disk_config = optional(list(object({
            disk_size_gb           = optional(number)
            disk_type              = optional(string)
            provisioned_iops       = optional(number)
            provisioned_throughput = optional(number)
          })))
          boot_disk_provisioned_iops       = optional(number)
          boot_disk_provisioned_throughput = optional(number)
          boot_disk_size_gb                = optional(number)
          boot_disk_type                   = optional(string)
          local_ssd_interface              = optional(string)
          num_local_ssds                   = optional(number)
        }))
        image_uri = optional(string)
        instance_flexibility_policy = optional(object({
          instance_selection_list = optional(list(object({
            disk_config = optional(object({
              attached_disk_config = optional(list(object({
                disk_size_gb           = optional(number)
                disk_type              = optional(string)
                provisioned_iops       = optional(number)
                provisioned_throughput = optional(number)
              })))
              boot_disk_provisioned_iops       = optional(number)
              boot_disk_provisioned_throughput = optional(number)
              boot_disk_size_gb                = optional(number)
              boot_disk_type                   = optional(string)
              local_ssd_interface              = optional(string)
              num_local_ssds                   = optional(number)
            }))
            machine_types = optional(list(string))
            rank          = optional(number)
          })))
        }))
        machine_type     = optional(string)
        min_cpu_platform = optional(string)
        num_instances    = optional(number)
      }))
      metastore_config = optional(object({
        dataproc_metastore_service = string
      }))
      preemptible_worker_config = optional(object({
        disk_config = optional(object({
          attached_disk_config = optional(list(object({
            disk_size_gb           = optional(number)
            disk_type              = optional(string)
            provisioned_iops       = optional(number)
            provisioned_throughput = optional(number)
          })))
          boot_disk_provisioned_iops       = optional(number)
          boot_disk_provisioned_throughput = optional(number)
          boot_disk_size_gb                = optional(number)
          boot_disk_type                   = optional(string)
          local_ssd_interface              = optional(string)
          num_local_ssds                   = optional(number)
        }))
        instance_flexibility_policy = optional(object({
          instance_selection_list = optional(list(object({
            disk_config = optional(object({
              attached_disk_config = optional(list(object({
                disk_size_gb           = optional(number)
                disk_type              = optional(string)
                provisioned_iops       = optional(number)
                provisioned_throughput = optional(number)
              })))
              boot_disk_provisioned_iops       = optional(number)
              boot_disk_provisioned_throughput = optional(number)
              boot_disk_size_gb                = optional(number)
              boot_disk_type                   = optional(string)
              local_ssd_interface              = optional(string)
              num_local_ssds                   = optional(number)
            }))
            machine_types = optional(list(string))
            rank          = optional(number)
          })))
          provisioning_model_mix = optional(object({
            standard_capacity_base               = optional(number)
            standard_capacity_percent_above_base = optional(number)
          }))
        }))
        num_instances  = optional(number)
        preemptibility = optional(string)
      }))
      security_config = optional(object({
        identity_config = optional(object({
          user_service_account_mapping = map(string)
        }))
        kerberos_config = optional(object({
          cross_realm_trust_admin_server        = optional(string)
          cross_realm_trust_kdc                 = optional(string)
          cross_realm_trust_realm               = optional(string)
          cross_realm_trust_shared_password_uri = optional(string)
          enable_kerberos                       = optional(bool)
          kdc_db_key_uri                        = optional(string)
          key_password_uri                      = optional(string)
          keystore_password_uri                 = optional(string)
          keystore_uri                          = optional(string)
          kms_key_uri                           = string
          realm                                 = optional(string)
          root_principal_password_uri           = string
          tgt_lifetime_hours                    = optional(number)
          truststore_password_uri               = optional(string)
          truststore_uri                        = optional(string)
        }))
      }))
      software_config = optional(object({
        image_version       = optional(string)
        optional_components = optional(set(string))
        override_properties = optional(map(string))
      }))
      staging_bucket = optional(string)
      temp_bucket    = optional(string)
      worker_config = optional(object({
        accelerators = optional(list(object({
          accelerator_count = number
          accelerator_type  = string
        })))
        disk_config = optional(object({
          attached_disk_config = optional(list(object({
            disk_size_gb           = optional(number)
            disk_type              = optional(string)
            provisioned_iops       = optional(number)
            provisioned_throughput = optional(number)
          })))
          boot_disk_provisioned_iops       = optional(number)
          boot_disk_provisioned_throughput = optional(number)
          boot_disk_size_gb                = optional(number)
          boot_disk_type                   = optional(string)
          local_ssd_interface              = optional(string)
          num_local_ssds                   = optional(number)
        }))
        image_uri = optional(string)
        instance_flexibility_policy = optional(object({
          instance_selection_list = optional(list(object({
            disk_config = optional(object({
              attached_disk_config = optional(list(object({
                disk_size_gb           = optional(number)
                disk_type              = optional(string)
                provisioned_iops       = optional(number)
                provisioned_throughput = optional(number)
              })))
              boot_disk_provisioned_iops       = optional(number)
              boot_disk_provisioned_throughput = optional(number)
              boot_disk_size_gb                = optional(number)
              boot_disk_type                   = optional(string)
              local_ssd_interface              = optional(string)
              num_local_ssds                   = optional(number)
            }))
            machine_types = optional(list(string))
            rank          = optional(number)
          })))
        }))
        machine_type      = optional(string)
        min_cpu_platform  = optional(string)
        min_num_instances = optional(number)
        num_instances     = optional(number)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    virtual_cluster_config = optional(object({
      auxiliary_services_config = optional(object({
        metastore_config = optional(object({
          dataproc_metastore_service = optional(string)
        }))
        spark_history_server_config = optional(object({
          dataproc_cluster = optional(string)
        }))
      }))
      kubernetes_cluster_config = optional(object({
        gke_cluster_config = object({
          gke_cluster_target = optional(string)
          node_pool_target = optional(list(object({
            node_pool = string
            node_pool_config = optional(object({
              autoscaling = optional(object({
                max_node_count = optional(number)
                min_node_count = optional(number)
              }))
              config = optional(object({
                local_ssd_count  = optional(number)
                machine_type     = optional(string)
                min_cpu_platform = optional(string)
                preemptible      = optional(bool)
                spot             = optional(bool)
              }))
              locations = set(string)
            }))
            roles = set(string)
          })))
        })
        kubernetes_namespace = optional(string)
        kubernetes_software_config = object({
          component_version = map(string)
          properties        = optional(map(string))
        })
      }))
      staging_bucket = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.auxiliary_node_groups == null || alltrue([for item in v.cluster_config.auxiliary_node_groups : (length(item.node_group) >= 1)]))
      )
    ])
    error_message = "Each node_group list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.dataproc_metric_config == null || (length(v.cluster_config.dataproc_metric_config.metrics) >= 1))
      )
    ])
    error_message = "Each metrics list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.cluster_tier == null || (contains(["CLUSTER_TIER_UNSPECIFIED", "CLUSTER_TIER_STANDARD", "CLUSTER_TIER_PREMIUM"], v.cluster_config.cluster_tier)))
      )
    ])
    error_message = "must be one of: \"CLUSTER_TIER_UNSPECIFIED\", \"CLUSTER_TIER_STANDARD\", \"CLUSTER_TIER_PREMIUM\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.engine == null || (contains(["ENGINE_UNSPECIFIED", "DEFAULT", "LIGHTNING"], v.cluster_config.engine)))
      )
    ])
    error_message = "must be one of: \"ENGINE_UNSPECIFIED\", \"DEFAULT\", \"LIGHTNING\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.cluster_type == null || (contains(["CLUSTER_TYPE_UNSPECIFIED", "STANDARD", "SINGLE_NODE", "ZERO_SCALE"], v.cluster_config.cluster_type)))
      )
    ])
    error_message = "must be one of: \"CLUSTER_TYPE_UNSPECIFIED\", \"STANDARD\", \"SINGLE_NODE\", \"ZERO_SCALE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.gce_cluster_config == null || (v.cluster_config.gce_cluster_config.reservation_affinity == null || (v.cluster_config.gce_cluster_config.reservation_affinity.consume_reservation_type == null || (contains(["NO_RESERVATION", "ANY_RESERVATION", "SPECIFIC_RESERVATION"], v.cluster_config.gce_cluster_config.reservation_affinity.consume_reservation_type)))))
      )
    ])
    error_message = "must be one of: \"NO_RESERVATION\", \"ANY_RESERVATION\", \"SPECIFIC_RESERVATION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.gce_cluster_config == null || (v.cluster_config.gce_cluster_config.confidential_instance_config == null || (v.cluster_config.gce_cluster_config.confidential_instance_config.confidential_instance_type == null || (contains(["SEV", "SEV_SNP", "TDX"], v.cluster_config.gce_cluster_config.confidential_instance_config.confidential_instance_type)))))
      )
    ])
    error_message = "must be one of: \"SEV\", \"SEV_SNP\", \"TDX\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.master_config == null || (v.cluster_config.master_config.disk_config == null || (v.cluster_config.master_config.disk_config.boot_disk_size_gb == null || (v.cluster_config.master_config.disk_config.boot_disk_size_gb >= 10))))
      )
    ])
    error_message = "must be at least 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.worker_config == null || (v.cluster_config.worker_config.disk_config == null || (v.cluster_config.worker_config.disk_config.boot_disk_size_gb == null || (v.cluster_config.worker_config.disk_config.boot_disk_size_gb >= 10))))
      )
    ])
    error_message = "must be at least 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.preemptible_worker_config == null || (v.cluster_config.preemptible_worker_config.preemptibility == null || (contains(["PREEMPTIBILITY_UNSPECIFIED", "NON_PREEMPTIBLE", "PREEMPTIBLE", "SPOT"], v.cluster_config.preemptible_worker_config.preemptibility))))
      )
    ])
    error_message = "must be one of: \"PREEMPTIBILITY_UNSPECIFIED\", \"NON_PREEMPTIBLE\", \"PREEMPTIBLE\", \"SPOT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.preemptible_worker_config == null || (v.cluster_config.preemptible_worker_config.disk_config == null || (v.cluster_config.preemptible_worker_config.disk_config.boot_disk_size_gb == null || (v.cluster_config.preemptible_worker_config.disk_config.boot_disk_size_gb >= 10))))
      )
    ])
    error_message = "must be at least 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.preemptible_worker_config == null || (v.cluster_config.preemptible_worker_config.instance_flexibility_policy == null || (v.cluster_config.preemptible_worker_config.instance_flexibility_policy.provisioning_model_mix == null || (v.cluster_config.preemptible_worker_config.instance_flexibility_policy.provisioning_model_mix.standard_capacity_base == null || (v.cluster_config.preemptible_worker_config.instance_flexibility_policy.provisioning_model_mix.standard_capacity_base >= 0)))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.preemptible_worker_config == null || (v.cluster_config.preemptible_worker_config.instance_flexibility_policy == null || (v.cluster_config.preemptible_worker_config.instance_flexibility_policy.provisioning_model_mix == null || (v.cluster_config.preemptible_worker_config.instance_flexibility_policy.provisioning_model_mix.standard_capacity_percent_above_base == null || (v.cluster_config.preemptible_worker_config.instance_flexibility_policy.provisioning_model_mix.standard_capacity_percent_above_base >= 0 && v.cluster_config.preemptible_worker_config.instance_flexibility_policy.provisioning_model_mix.standard_capacity_percent_above_base <= 100)))))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.dataproc_metric_config == null || (alltrue([for item in v.cluster_config.dataproc_metric_config.metrics : (contains(["MONITORING_AGENT_DEFAULTS", "HDFS", "SPARK", "YARN", "SPARK_HISTORY_SERVER", "HIVESERVER2"], item.metric_source))])))
      )
    ])
    error_message = "must be one of: \"MONITORING_AGENT_DEFAULTS\", \"HDFS\", \"SPARK\", \"YARN\", \"SPARK_HISTORY_SERVER\", \"HIVESERVER2\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.auxiliary_node_groups == null || alltrue([for item in v.cluster_config.auxiliary_node_groups : (alltrue([for item in item.node_group : (alltrue([for x in item.roles : contains(["ROLE_UNSPECIFIED", "DRIVER"], x)]))]))]))
      )
    ])
    error_message = "must be one of: \"ROLE_UNSPECIFIED\", \"DRIVER\""
  }
  validation {
    condition = alltrue([
      for k, v in var.dataproc_clusters : (
        v.cluster_config == null || (v.cluster_config.auxiliary_node_groups == null || alltrue([for item in v.cluster_config.auxiliary_node_groups : (alltrue([for item in item.node_group : (item.node_group_config == null || (item.node_group_config.disk_config == null || (item.node_group_config.disk_config.boot_disk_size_gb == null || (item.node_group_config.disk_config.boot_disk_size_gb >= 10))))]))]))
      )
    ])
    error_message = "must be at least 10"
  }
}

