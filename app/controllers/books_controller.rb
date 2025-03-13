class BooksController < ApplicationController
  def index
    @books = Documents::Book.all.page(params[:page])

    # Продьюсим событие в Кафка, которое показывает, какая страница была открыта
    BooksProducer.page_opened(42)

    render formats: :json
  end
end
