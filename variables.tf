variable "catalog_integration_lookup" {
  description = <<EOT
Map of catalog_integration_lookup, attributes below
Required:
    - id
    - environment (block):
        - id (required)
    - kafka_cluster (block):
        - id (required)
Optional:
    - credentials (block):
        - key (required)
        - secret (required)
EOT

  type = map(object({
    id = string
    environment = object({
      id = string
    })
    kafka_cluster = object({
      id = string
    })
    credentials = optional(object({
      key    = string
      secret = string
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

