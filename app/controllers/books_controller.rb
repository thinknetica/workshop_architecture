class BooksController < ApplicationController
  def index
    # TODO: добавить поле с рейтингом книги, чтобы сортировать по нему ?
    books = Book.includes(:authors, :language).order(:id).page(page)

    render json: BookResource.new(books)
  end

  private

  # TODO: добавить контракт валидации параметров, чтобы по умолчанию ставить 1 ?
  # TODO: вынести параметры пагинации page/per в концерн, чтобы не дублировать ?
  def page = params[:page].to_i.positive? ? params[:page].to_i : 1
end
