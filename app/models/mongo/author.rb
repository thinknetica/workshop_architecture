module Mongo
  class Author
    include Mongoid::Document

    field :id, type: String
    field :first_name, type: String
    field :last_name, type: String
    field :middle_name, type: String
    field :original, type: String
  end
end
