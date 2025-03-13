module Mongo
  class Genre
    include Mongoid::Document

    field :id, type: String
    field :slug, type: String
    field :name, type: String
  end
end
