class BookResource
  include Alba::Resource

  attributes :title, :series, :serno, :libid, :size, :filename, :del, :ext, :published_at, :created_at, :updated_at

end
