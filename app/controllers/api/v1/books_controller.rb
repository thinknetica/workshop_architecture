module Api
  module V1
    class BooksController < ApplicationController
      def index
        permitted_params = index_params.to_h
        books = Books::IndexInteractor.call(page: permitted_params[:page])
        render json: { data: Books::Index::BookResource.new(books).to_h }
      end

      private
      def index_params
        params.permit(:page)
      end
    end
  end
end
