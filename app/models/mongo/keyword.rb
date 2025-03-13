module Mongo
  class Keyword
    include Mongoid::Document

    field :id, type: String
    field :name, type: String
  end
end
