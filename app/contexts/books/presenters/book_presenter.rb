class Books::Presenters::BookPresenter
  def initialize(book_data)
    @book = book_data.with_indifferent_access
  end

  def to_h
    {
      id: id,
      title: title,
      author: author,
      description: description,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  private

  def id
    @book[:id] || @book[:_id]
  end

  def title
    @book[:title].titleize
  end

  def author
    @book[:author].presence || 'Unknown Author'
  end

  def description
    @book[:description].to_s
  end

  def created_at
    @book[:created_at]
  end

  def updated_at
    @book[:updated_at]
  end
end