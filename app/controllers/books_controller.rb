class BooksController < ApplicationController
  def index
    @books = Book.all.page(params[:page])

    render json: BookSerializer.new(@books).serialize
  end
end
