resource "google_dataproc_cluster" "dataproc_clusters" {
  for_each = var.dataproc_clusters

  name                          = each.value.name
  deletion_policy               = each.value.deletion_policy
  graceful_decommission_timeout = each.value.graceful_decommission_timeout
  labels                        = each.value.labels
  project                       = each.value.project
  region                        = each.value.region

  dynamic "cluster_config" {
    for_each = each.value.cluster_config != null ? [each.value.cluster_config] : []
    content {
      dynamic "autoscaling_config" {
        for_each = cluster_config.value.autoscaling_config != null ? [cluster_config.value.autoscaling_config] : []
        content {
          policy_uri = autoscaling_config.value.policy_uri
        }
      }
      dynamic "auxiliary_node_groups" {
        for_each = cluster_config.value.auxiliary_node_groups != null ? cluster_config.value.auxiliary_node_groups : []
        content {
          dynamic "node_group" {
            for_each = auxiliary_node_groups.value.node_group
            content {
              dynamic "node_group_config" {
                for_each = node_group.value.node_group_config != null ? [node_group.value.node_group_config] : []
                content {
                  dynamic "accelerators" {
                    for_each = node_group_config.value.accelerators != null ? node_group_config.value.accelerators : []
                    content {
                      accelerator_count = accelerators.value.accelerator_count
                      accelerator_type  = accelerators.value.accelerator_type
                    }
                  }
                  dynamic "disk_config" {
                    for_each = node_group_config.value.disk_config != null ? [node_group_config.value.disk_config] : []
                    content {
                      boot_disk_provisioned_iops       = disk_config.value.boot_disk_provisioned_iops
                      boot_disk_provisioned_throughput = disk_config.value.boot_disk_provisioned_throughput
                      boot_disk_size_gb                = disk_config.value.boot_disk_size_gb
                      boot_disk_type                   = disk_config.value.boot_disk_type
                      local_ssd_interface              = disk_config.value.local_ssd_interface
                      num_local_ssds                   = disk_config.value.num_local_ssds
                    }
                  }
                  machine_type     = node_group_config.value.machine_type
                  min_cpu_platform = node_group_config.value.min_cpu_platform
                  num_instances    = node_group_config.value.num_instances
                }
              }
              roles = node_group.value.roles
            }
          }
          node_group_id = auxiliary_node_groups.value.node_group_id
        }
      }
      cluster_tier = cluster_config.value.cluster_tier
      cluster_type = cluster_config.value.cluster_type
      dynamic "dataproc_metric_config" {
        for_each = cluster_config.value.dataproc_metric_config != null ? [cluster_config.value.dataproc_metric_config] : []
        content {
          dynamic "metrics" {
            for_each = dataproc_metric_config.value.metrics
            content {
              metric_overrides = metrics.value.metric_overrides
              metric_source    = metrics.value.metric_source
            }
          }
        }
      }
      dynamic "encryption_config" {
        for_each = cluster_config.value.encryption_config != null ? [cluster_config.value.encryption_config] : []
        content {
          kms_key_name = encryption_config.value.kms_key_name
        }
      }
      dynamic "endpoint_config" {
        for_each = cluster_config.value.endpoint_config != null ? [cluster_config.value.endpoint_config] : []
        content {
          enable_http_port_access = endpoint_config.value.enable_http_port_access
        }
      }
      engine = cluster_config.value.engine
      dynamic "gce_cluster_config" {
        for_each = cluster_config.value.gce_cluster_config != null ? [cluster_config.value.gce_cluster_config] : []
        content {
          dynamic "confidential_instance_config" {
            for_each = gce_cluster_config.value.confidential_instance_config != null ? [gce_cluster_config.value.confidential_instance_config] : []
            content {
              confidential_instance_type  = confidential_instance_config.value.confidential_instance_type
              enable_confidential_compute = confidential_instance_config.value.enable_confidential_compute
            }
          }
          internal_ip_only = gce_cluster_config.value.internal_ip_only
          metadata         = gce_cluster_config.value.metadata
          network          = gce_cluster_config.value.network
          dynamic "node_group_affinity" {
            for_each = gce_cluster_config.value.node_group_affinity != null ? [gce_cluster_config.value.node_group_affinity] : []
            content {
              node_group_uri = node_group_affinity.value.node_group_uri
            }
          }
          dynamic "reservation_affinity" {
            for_each = gce_cluster_config.value.reservation_affinity != null ? [gce_cluster_config.value.reservation_affinity] : []
            content {
              consume_reservation_type = reservation_affinity.value.consume_reservation_type
              key                      = reservation_affinity.value.key
              values                   = reservation_affinity.value.values
            }
          }
          resource_manager_tags  = gce_cluster_config.value.resource_manager_tags
          service_account        = gce_cluster_config.value.service_account
          service_account_scopes = gce_cluster_config.value.service_account_scopes
          dynamic "shielded_instance_config" {
            for_each = gce_cluster_config.value.shielded_instance_config != null ? [gce_cluster_config.value.shielded_instance_config] : []
            content {
              enable_integrity_monitoring = shielded_instance_config.value.enable_integrity_monitoring
              enable_secure_boot          = shielded_instance_config.value.enable_secure_boot
              enable_vtpm                 = shielded_instance_config.value.enable_vtpm
            }
          }
          subnetwork = gce_cluster_config.value.subnetwork
          tags       = gce_cluster_config.value.tags
          zone       = gce_cluster_config.value.zone
        }
      }
      dynamic "initialization_action" {
        for_each = cluster_config.value.initialization_action != null ? cluster_config.value.initialization_action : []
        content {
          script      = initialization_action.value.script
          timeout_sec = initialization_action.value.timeout_sec
        }
      }
      dynamic "lifecycle_config" {
        for_each = cluster_config.value.lifecycle_config != null ? [cluster_config.value.lifecycle_config] : []
        content {
          auto_delete_time = lifecycle_config.value.auto_delete_time
          auto_stop_time   = lifecycle_config.value.auto_stop_time
          idle_delete_ttl  = lifecycle_config.value.idle_delete_ttl
          idle_stop_ttl    = lifecycle_config.value.idle_stop_ttl
        }
      }
      dynamic "master_config" {
        for_each = cluster_config.value.master_config != null ? [cluster_config.value.master_config] : []
        content {
          dynamic "accelerators" {
            for_each = master_config.value.accelerators != null ? master_config.value.accelerators : []
            content {
              accelerator_count = accelerators.value.accelerator_count
              accelerator_type  = accelerators.value.accelerator_type
            }
          }
          dynamic "disk_config" {
            for_each = master_config.value.disk_config != null ? [master_config.value.disk_config] : []
            content {
              dynamic "attached_disk_config" {
                for_each = disk_config.value.attached_disk_config != null ? disk_config.value.attached_disk_config : []
                content {
                  disk_size_gb           = attached_disk_config.value.disk_size_gb
                  disk_type              = attached_disk_config.value.disk_type
                  provisioned_iops       = attached_disk_config.value.provisioned_iops
                  provisioned_throughput = attached_disk_config.value.provisioned_throughput
                }
              }
              boot_disk_provisioned_iops       = disk_config.value.boot_disk_provisioned_iops
              boot_disk_provisioned_throughput = disk_config.value.boot_disk_provisioned_throughput
              boot_disk_size_gb                = disk_config.value.boot_disk_size_gb
              boot_disk_type                   = disk_config.value.boot_disk_type
              local_ssd_interface              = disk_config.value.local_ssd_interface
              num_local_ssds                   = disk_config.value.num_local_ssds
            }
          }
          image_uri = master_config.value.image_uri
          dynamic "instance_flexibility_policy" {
            for_each = master_config.value.instance_flexibility_policy != null ? [master_config.value.instance_flexibility_policy] : []
            content {
              dynamic "instance_selection_list" {
                for_each = instance_flexibility_policy.value.instance_selection_list != null ? instance_flexibility_policy.value.instance_selection_list : []
                content {
                  dynamic "disk_config" {
                    for_each = instance_selection_list.value.disk_config != null ? [instance_selection_list.value.disk_config] : []
                    content {
                      dynamic "attached_disk_config" {
                        for_each = disk_config.value.attached_disk_config != null ? disk_config.value.attached_disk_config : []
                        content {
                          disk_size_gb           = attached_disk_config.value.disk_size_gb
                          disk_type              = attached_disk_config.value.disk_type
                          provisioned_iops       = attached_disk_config.value.provisioned_iops
                          provisioned_throughput = attached_disk_config.value.provisioned_throughput
                        }
                      }
                      boot_disk_provisioned_iops       = disk_config.value.boot_disk_provisioned_iops
                      boot_disk_provisioned_throughput = disk_config.value.boot_disk_provisioned_throughput
                      boot_disk_size_gb                = disk_config.value.boot_disk_size_gb
                      boot_disk_type                   = disk_config.value.boot_disk_type
                      local_ssd_interface              = disk_config.value.local_ssd_interface
                      num_local_ssds                   = disk_config.value.num_local_ssds
                    }
                  }
                  machine_types = instance_selection_list.value.machine_types
                  rank          = instance_selection_list.value.rank
                }
              }
            }
          }
          machine_type     = master_config.value.machine_type
          min_cpu_platform = master_config.value.min_cpu_platform
          num_instances    = master_config.value.num_instances
        }
      }
      dynamic "metastore_config" {
        for_each = cluster_config.value.metastore_config != null ? [cluster_config.value.metastore_config] : []
        content {
          dataproc_metastore_service = metastore_config.value.dataproc_metastore_service
        }
      }
      dynamic "preemptible_worker_config" {
        for_each = cluster_config.value.preemptible_worker_config != null ? [cluster_config.value.preemptible_worker_config] : []
        content {
          dynamic "disk_config" {
            for_each = preemptible_worker_config.value.disk_config != null ? [preemptible_worker_config.value.disk_config] : []
            content {
              dynamic "attached_disk_config" {
                for_each = disk_config.value.attached_disk_config != null ? disk_config.value.attached_disk_config : []
                content {
                  disk_size_gb           = attached_disk_config.value.disk_size_gb
                  disk_type              = attached_disk_config.value.disk_type
                  provisioned_iops       = attached_disk_config.value.provisioned_iops
                  provisioned_throughput = attached_disk_config.value.provisioned_throughput
                }
              }
              boot_disk_provisioned_iops       = disk_config.value.boot_disk_provisioned_iops
              boot_disk_provisioned_throughput = disk_config.value.boot_disk_provisioned_throughput
              boot_disk_size_gb                = disk_config.value.boot_disk_size_gb
              boot_disk_type                   = disk_config.value.boot_disk_type
              local_ssd_interface              = disk_config.value.local_ssd_interface
              num_local_ssds                   = disk_config.value.num_local_ssds
            }
          }
          dynamic "instance_flexibility_policy" {
            for_each = preemptible_worker_config.value.instance_flexibility_policy != null ? [preemptible_worker_config.value.instance_flexibility_policy] : []
            content {
              dynamic "instance_selection_list" {
                for_each = instance_flexibility_policy.value.instance_selection_list != null ? instance_flexibility_policy.value.instance_selection_list : []
                content {
                  dynamic "disk_config" {
                    for_each = instance_selection_list.value.disk_config != null ? [instance_selection_list.value.disk_config] : []
                    content {
                      dynamic "attached_disk_config" {
                        for_each = disk_config.value.attached_disk_config != null ? disk_config.value.attached_disk_config : []
                        content {
                          disk_size_gb           = attached_disk_config.value.disk_size_gb
                          disk_type              = attached_disk_config.value.disk_type
                          provisioned_iops       = attached_disk_config.value.provisioned_iops
                          provisioned_throughput = attached_disk_config.value.provisioned_throughput
                        }
                      }
                      boot_disk_provisioned_iops       = disk_config.value.boot_disk_provisioned_iops
                      boot_disk_provisioned_throughput = disk_config.value.boot_disk_provisioned_throughput
                      boot_disk_size_gb                = disk_config.value.boot_disk_size_gb
                      boot_disk_type                   = disk_config.value.boot_disk_type
                      local_ssd_interface              = disk_config.value.local_ssd_interface
                      num_local_ssds                   = disk_config.value.num_local_ssds
                    }
                  }
                  machine_types = instance_selection_list.value.machine_types
                  rank          = instance_selection_list.value.rank
                }
              }
              dynamic "provisioning_model_mix" {
                for_each = instance_flexibility_policy.value.provisioning_model_mix != null ? [instance_flexibility_policy.value.provisioning_model_mix] : []
                content {
                  standard_capacity_base               = provisioning_model_mix.value.standard_capacity_base
                  standard_capacity_percent_above_base = provisioning_model_mix.value.standard_capacity_percent_above_base
                }
              }
            }
          }
          num_instances  = preemptible_worker_config.value.num_instances
          preemptibility = preemptible_worker_config.value.preemptibility
        }
      }
      dynamic "security_config" {
        for_each = cluster_config.value.security_config != null ? [cluster_config.value.security_config] : []
        content {
          dynamic "identity_config" {
            for_each = security_config.value.identity_config != null ? [security_config.value.identity_config] : []
            content {
              user_service_account_mapping = identity_config.value.user_service_account_mapping
            }
          }
          dynamic "kerberos_config" {
            for_each = security_config.value.kerberos_config != null ? [security_config.value.kerberos_config] : []
            content {
              cross_realm_trust_admin_server        = kerberos_config.value.cross_realm_trust_admin_server
              cross_realm_trust_kdc                 = kerberos_config.value.cross_realm_trust_kdc
              cross_realm_trust_realm               = kerberos_config.value.cross_realm_trust_realm
              cross_realm_trust_shared_password_uri = kerberos_config.value.cross_realm_trust_shared_password_uri
              enable_kerberos                       = kerberos_config.value.enable_kerberos
              kdc_db_key_uri                        = kerberos_config.value.kdc_db_key_uri
              key_password_uri                      = kerberos_config.value.key_password_uri
              keystore_password_uri                 = kerberos_config.value.keystore_password_uri
              keystore_uri                          = kerberos_config.value.keystore_uri
              kms_key_uri                           = kerberos_config.value.kms_key_uri
              realm                                 = kerberos_config.value.realm
              root_principal_password_uri           = kerberos_config.value.root_principal_password_uri
              tgt_lifetime_hours                    = kerberos_config.value.tgt_lifetime_hours
              truststore_password_uri               = kerberos_config.value.truststore_password_uri
              truststore_uri                        = kerberos_config.value.truststore_uri
            }
          }
        }
      }
      dynamic "software_config" {
        for_each = cluster_config.value.software_config != null ? [cluster_config.value.software_config] : []
        content {
          image_version       = software_config.value.image_version
          optional_components = software_config.value.optional_components
          override_properties = software_config.value.override_properties
        }
      }
      staging_bucket = cluster_config.value.staging_bucket
      temp_bucket    = cluster_config.value.temp_bucket
      dynamic "worker_config" {
        for_each = cluster_config.value.worker_config != null ? [cluster_config.value.worker_config] : []
        content {
          dynamic "accelerators" {
            for_each = worker_config.value.accelerators != null ? worker_config.value.accelerators : []
            content {
              accelerator_count = accelerators.value.accelerator_count
              accelerator_type  = accelerators.value.accelerator_type
            }
          }
          dynamic "disk_config" {
            for_each = worker_config.value.disk_config != null ? [worker_config.value.disk_config] : []
            content {
              dynamic "attached_disk_config" {
                for_each = disk_config.value.attached_disk_config != null ? disk_config.value.attached_disk_config : []
                content {
                  disk_size_gb           = attached_disk_config.value.disk_size_gb
                  disk_type              = attached_disk_config.value.disk_type
                  provisioned_iops       = attached_disk_config.value.provisioned_iops
                  provisioned_throughput = attached_disk_config.value.provisioned_throughput
                }
              }
              boot_disk_provisioned_iops       = disk_config.value.boot_disk_provisioned_iops
              boot_disk_provisioned_throughput = disk_config.value.boot_disk_provisioned_throughput
              boot_disk_size_gb                = disk_config.value.boot_disk_size_gb
              boot_disk_type                   = disk_config.value.boot_disk_type
              local_ssd_interface              = disk_config.value.local_ssd_interface
              num_local_ssds                   = disk_config.value.num_local_ssds
            }
          }
          image_uri = worker_config.value.image_uri
          dynamic "instance_flexibility_policy" {
            for_each = worker_config.value.instance_flexibility_policy != null ? [worker_config.value.instance_flexibility_policy] : []
            content {
              dynamic "instance_selection_list" {
                for_each = instance_flexibility_policy.value.instance_selection_list != null ? instance_flexibility_policy.value.instance_selection_list : []
                content {
                  dynamic "disk_config" {
                    for_each = instance_selection_list.value.disk_config != null ? [instance_selection_list.value.disk_config] : []
                    content {
                      dynamic "attached_disk_config" {
                        for_each = disk_config.value.attached_disk_config != null ? disk_config.value.attached_disk_config : []
                        content {
                          disk_size_gb           = attached_disk_config.value.disk_size_gb
                          disk_type              = attached_disk_config.value.disk_type
                          provisioned_iops       = attached_disk_config.value.provisioned_iops
                          provisioned_throughput = attached_disk_config.value.provisioned_throughput
                        }
                      }
                      boot_disk_provisioned_iops       = disk_config.value.boot_disk_provisioned_iops
                      boot_disk_provisioned_throughput = disk_config.value.boot_disk_provisioned_throughput
                      boot_disk_size_gb                = disk_config.value.boot_disk_size_gb
                      boot_disk_type                   = disk_config.value.boot_disk_type
                      local_ssd_interface              = disk_config.value.local_ssd_interface
                      num_local_ssds                   = disk_config.value.num_local_ssds
                    }
                  }
                  machine_types = instance_selection_list.value.machine_types
                  rank          = instance_selection_list.value.rank
                }
              }
            }
          }
          machine_type      = worker_config.value.machine_type
          min_cpu_platform  = worker_config.value.min_cpu_platform
          min_num_instances = worker_config.value.min_num_instances
          num_instances     = worker_config.value.num_instances
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "virtual_cluster_config" {
    for_each = each.value.virtual_cluster_config != null ? [each.value.virtual_cluster_config] : []
    content {
      dynamic "auxiliary_services_config" {
        for_each = virtual_cluster_config.value.auxiliary_services_config != null ? [virtual_cluster_config.value.auxiliary_services_config] : []
        content {
          dynamic "metastore_config" {
            for_each = auxiliary_services_config.value.metastore_config != null ? [auxiliary_services_config.value.metastore_config] : []
            content {
              dataproc_metastore_service = metastore_config.value.dataproc_metastore_service
            }
          }
          dynamic "spark_history_server_config" {
            for_each = auxiliary_services_config.value.spark_history_server_config != null ? [auxiliary_services_config.value.spark_history_server_config] : []
            content {
              dataproc_cluster = spark_history_server_config.value.dataproc_cluster
            }
          }
        }
      }
      dynamic "kubernetes_cluster_config" {
        for_each = virtual_cluster_config.value.kubernetes_cluster_config != null ? [virtual_cluster_config.value.kubernetes_cluster_config] : []
        content {
          gke_cluster_config {
            gke_cluster_target = kubernetes_cluster_config.value.gke_cluster_config.gke_cluster_target
            dynamic "node_pool_target" {
              for_each = kubernetes_cluster_config.value.gke_cluster_config.node_pool_target != null ? kubernetes_cluster_config.value.gke_cluster_config.node_pool_target : []
              content {
                node_pool = node_pool_target.value.node_pool
                dynamic "node_pool_config" {
                  for_each = node_pool_target.value.node_pool_config != null ? [node_pool_target.value.node_pool_config] : []
                  content {
                    dynamic "autoscaling" {
                      for_each = node_pool_config.value.autoscaling != null ? [node_pool_config.value.autoscaling] : []
                      content {
                        max_node_count = autoscaling.value.max_node_count
                        min_node_count = autoscaling.value.min_node_count
                      }
                    }
                    dynamic "config" {
                      for_each = node_pool_config.value.config != null ? [node_pool_config.value.config] : []
                      content {
                        local_ssd_count  = config.value.local_ssd_count
                        machine_type     = config.value.machine_type
                        min_cpu_platform = config.value.min_cpu_platform
                        preemptible      = config.value.preemptible
                        spot             = config.value.spot
                      }
                    }
                    locations = node_pool_config.value.locations
                  }
                }
                roles = node_pool_target.value.roles
              }
            }
          }
          kubernetes_namespace = kubernetes_cluster_config.value.kubernetes_namespace
          kubernetes_software_config {
            component_version = kubernetes_cluster_config.value.kubernetes_software_config.component_version
            properties        = kubernetes_cluster_config.value.kubernetes_software_config.properties
          }
        }
      }
      staging_bucket = virtual_cluster_config.value.staging_bucket
    }
  }
}

