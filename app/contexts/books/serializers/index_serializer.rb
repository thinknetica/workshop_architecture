class Books::IndexSerializer
  def initialize(books, pagination_meta)
    @books = books
    @pagination_meta = pagination_meta
  end

  def as_json(*)
    {
      data: BookResource.new(@books),
      meta: meta
    }
  end

  private

  def meta
    @pagination_meta.merge(
      total_pages: @books.total_pages,
      total_count: @books.total_count
    )
  end
end

