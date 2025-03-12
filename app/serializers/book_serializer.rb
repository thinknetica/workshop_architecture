class BookSerializer
  include Alba::Resource

  root_key :books

  attributes :id, :title, :insno, :libid

  many :authors
  one :language
end
