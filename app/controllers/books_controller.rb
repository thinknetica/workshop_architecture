class BooksController < ApplicationController
  include Pagination
  def index
    query = Book.includes(:authors, :genres, :keywords, :folder, :language)

    render json: paginate_json(
      scope: query,
      key: :books,
      serializer: BookSerializer
    )
  end
end
