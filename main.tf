data "confluent_catalog_integration" "catalog_integration_lookup" {
  for_each = var.catalog_integration_lookup

  id = each.value.id

  environment {
    id = each.value.environment.id
  }

  kafka_cluster {
    id = each.value.kafka_cluster.id
  }

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }
}

