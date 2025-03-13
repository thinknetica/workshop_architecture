# frozen_string_literal: true

require 'karafka'

class KarafkaApp < Karafka::App
  setup do |config|
    config.client_id = 'rails_app'
    config.kafka = {
      'bootstrap.servers': 'kafka:9092'
    }
  end
end
