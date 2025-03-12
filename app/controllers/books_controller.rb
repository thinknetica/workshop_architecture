class BooksController < ApplicationController
  def index
    result = Books::PaginationService.new(params).call
    render json: Books::IndexSerializer.new(result[:books], result[:meta]).as_json
  rescue ArgumentError => e
    render_error(e.message, :bad_request)
  end 
end

