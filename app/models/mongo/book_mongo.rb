module Mongo
  class BookMongo
    include Mongoid::Document
    include Mongoid::Timestamps

    field :title, type: String
    field :series, type: String
    field :serno, type: String
    field :libid, type: Integer
    field :size, type: Integer
    field :filename, type: String
    field :del, type: Boolean
    field :ext, type: String
    field :published_at, type: Date
    field :insno, type: String
    field :folder_id, type: String
    field :language_id, type: String
  end
end
