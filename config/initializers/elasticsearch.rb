Elasticsearch::Model.client = Elasticsearch::Client.new(
  host: ENV['ELASTICSEARCH_URL'] || 'http://localhost:9200',
  retry_on_failure: 3,
  request_timeout: 30
)

