require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    let(:language) { create(:language) }
    let(:folder) { create(:folder) }
    let!(:books) { create_list(:book, 21, folder:, language:) }

    before do
      get :index
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns JSON with all books' do
      json_response = JSON.parse(response.body)

      expect(json_response.size).to eq(20)

      json_response.each_with_index do |book_json, index|
        expect(book_json['id']).to eq(books[index].id)
        expect(book_json['title']).to eq(books[index].title)
        expect(book_json['insno']).to eq(books[index].insno)
        expect(book_json['libid']).to eq(books[index].libid)
      end
    end

    context 'with pagination' do
      before do
        get :index, params: { page: 2 }
      end

      it 'returns only the first page of books' do
        json_response = JSON.parse(response.body)

        expect(json_response.size).to eq(books[20..].size)
      end
    end
  end
end
