class BooksController < ApplicationController
  def index
    books =  Book.all.order(:created_at).limit(::Settings.app.items_per_page)
    page = params[:page].to_i
    books = books.offset(page * ::Settings.app.items_per_page) if page > 1

    render json: serialize(books)
  end
end
