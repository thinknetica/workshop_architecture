module Mongo
  class Book
    include Mongoid::Document
    include Mongoid::Timestamps

    field :title, type: String
    field :series, type: String
    field :serno, type: String
    field :libid, type: Integer
    field :size, type: Integer
    field :filename, type: Integer
    field :del, type: Boolean
    field :ext, type: String
    field :published_at, type: Date
    field :insno, type: String
    field :language, type: String

    embeds_one :folder
    embeds_many :authors
    embeds_many :genres
    embeds_many :keywords
  end
end
