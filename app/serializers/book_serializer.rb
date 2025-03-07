class BookSerializer < ApplicationSerializer
  attributes :id, :title, :series, :serno, :libid, :size, :filename, :ext, :del, :insno, :published_at, :created_at, :updated_at
end
