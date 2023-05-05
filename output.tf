output "master_id" {
    value   = yandex_kubernetes_cluster.this.id 
}

output "endpoint" {
    value   = yandex_kubernetes_cluster.this.master[0].external_v4_endpoint 
}

