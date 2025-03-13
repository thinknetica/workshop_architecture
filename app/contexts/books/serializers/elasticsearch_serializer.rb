class Books::Serializers::ElasticsearchSerializer
  def initialize(books, meta)
    @books = books
    @meta = meta
  end

  def as_json(*)
    {
      data: @books.map { |book| ::Books::Presenters::BookPresenter.new(book).to_h },
      meta: @meta
    }
  end
end
