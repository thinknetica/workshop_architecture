class BooksController < ApplicationController
  def index
    query = Mongo::Book.all.page(params[:page]).per(Settings.app.items_per_page)

    render json: {
      books: query,
      pagination: {
        page: query.current_page,
        per_page: query.limit_value,
        page_count: query.total_pages,
        total: query.total_count
      }
    }
  end
end
