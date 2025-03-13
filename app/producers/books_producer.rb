# frozen_string_literal: true

require 'karafka'

class BooksProducer
  def self.page_opened(page_number)
    Karafka.producer.produce_sync(
      topic: 'books',
      payload: { page_number: page_number }.to_json
    )
  end
end
