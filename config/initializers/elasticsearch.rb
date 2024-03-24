# frozen_string_literal: true

config = {
  client: {
    hosts: ENV.fetch('ELASTICSEARCH_HOST', 'localhost:9200'),
    retry_on_failure: true,
    transport_options: { request: { timeout: 250 } }
  }
}

Searchkick.client = Elasticsearch::Client.new(config)
