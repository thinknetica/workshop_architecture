RSpec.describe BooksController, type: :controller do
  describe 'GET /index' do
    subject { get :index, params: }

    # Не создаем много книг, создаем 1 раз перед тестами
    let_it_be(:folder) { create(:folder) } # без этого не создастся книга
    let_it_be(:books) { create_list(:book_with_authors, 40, folder:).sort_by(&:id) }

    context 'когда не поданы никакие параметры' do
      let(:params) { {} }

      it_behaves_like 'сериализация книг на первой странице'
    end

    context 'когда подан параметр пагинации :page' do
      let(:params) { { page: 2 } }

      it_behaves_like 'сериализация книг на второй странице'
    end

    context 'когда подан параметр пагинации :page, который меньше 0' do
      let(:params) { { page: -1 } }

      it_behaves_like 'сериализация книг на первой странице'
    end
  end
end
