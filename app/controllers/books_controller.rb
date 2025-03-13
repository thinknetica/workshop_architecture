class BooksController < ApplicationController
  def index
    result = Books::ElasticsearchService.new(search_params).call
    render json: Books::Serializers::ElasticsearchSerializer.new(result[:books], result[:meta]).as_json
  rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
    render_error("Search index not found", :not_found)
  rescue ArgumentError, Elasticsearch::Transport::Transport::Errors::BadRequest => e
    render_error(e.message, :bad_request)
  end
  
  private

  def search_params
    params.permit(:query, :page, :per_page, :sort, :order)
  end
end
