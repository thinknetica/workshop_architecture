class BookSerializer
  include Alba::Resource

  attributes :id, :title, :series, :serno, :libid, :size, :filename,
             :del, :ext, :published_at, :insno

  one :folder, resource: FolderSerializer
  many :authors, resource: AuthorSerializer
  many :genres, resource: GenreSerializer
  many :keywords, resource: KeywordSerializer

  attribute :language do |book|
    book.language.slug
  end
end
