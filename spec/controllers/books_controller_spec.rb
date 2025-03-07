RSpec.describe BooksController, type: :controller do
  let(:per_page) { ::Settings.app.items_per_page }

  describe 'GET #index' do
    context 'when without page' do
      before { get :index }

      it 'responds with ok status' do
        expect(response).to have_http_status :ok
      end

      it 'responds first 20 books' do
        expect(JSON.parse(response.body).size).to eq(per_page)
      end
    end

    context 'when with page' do
      before { get :index, params: { page: 3 } }

      it 'responds with ok status' do
        expect(response).to have_http_status :ok
      end

      it 'returns other 20 books' do
        expect(JSON.parse(response.body).size).to eq(per_page)
      end
    end

    context 'when page too big' do
      before { get :index, params: { page: (Book.count / per_page + per_page) } }

      it 'responds with ok status' do
        expect(response).to have_http_status :ok
      end

      it 'returns 0 books' do
        expect(JSON.parse(response.body).size).to eq(0)
      end
    end
  end
end
