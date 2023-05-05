output "master_id" {
    value   = yandex_kubernetes_cluster.this.id 
}

output "endpoint" {
    value   = yandex_kubernetes_cluster.this.master.external_v4_endpoint 
}

