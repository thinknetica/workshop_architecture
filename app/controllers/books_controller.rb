class BooksController < ApplicationController
  def index
    page = params[:page].to_i.positive? ? params[:page].to_i : 1

    @books = Mongo::BookMongo.all.page(page)

    render formats: :json
  end
end
