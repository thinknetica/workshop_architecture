class BooksController < ApplicationController
  def index
    books =  Book.order(:created_at).limit(per_page).offset(page * per_page)

    render json: serialize(books)
  end

  private

  def per_page
    ::Settings.app.items_per_page
  end

  def page
    [ params[:page].to_i, 0 ].max
  end
end
