namespace :search do
  desc "Index all books to Elasticsearch"
  task index_books: :environment do
    require 'elasticsearch'

    client = Elasticsearch::Client.new(
      host: ENV['ELASTICSEARCH_URL'] || 'http://localhost:9200',
      log: true
    )

    index_name = 'books'

    # Создание индекса с маппингом
    unless client.indices.exists?(index: index_name)
      client.indices.create(
        index: index_name,
        body: {
          settings: {
            number_of_shards: 1,
            number_of_replicas: 0
          },
          mappings: {
            properties: {
              title: { type: 'text', analyzer: 'standard' },
              author: { type: 'keyword' },
              description: { type: 'text' },
              created_at: { type: 'date' },
              updated_at: { type: 'date' }
            }
          }
        }
      )
    end

    # Пагинационная индексация
    batch_size = 500
    total = Book.count
    processed = 0

    Book.find_in_batches(batch_size: batch_size) do |books|
      bulk_data = books.map do |book|
        {
          index: {
            _index: index_name,
            _id: book.id,
            data: book.attributes.slice(
              'title', 
              'author', 
              'description', 
              'created_at', 
              'updated_at'
            )
          }
        }
      end

      client.bulk(body: bulk_data)
      processed += books.size
      puts "Processed #{processed}/#{total} records"
    end

    puts "Indexing completed. Total indexed: #{processed}"
  rescue => e
    puts "Error: #{e.message}"
    exit 1
  end
end
