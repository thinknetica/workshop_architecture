describe Api::V1::BooksController do
  describe "GET #index" do
    subject(:call) { get :index }

    before do
      Settings.app.items_per_page = 2
    end

    context "when there are no books" do
      it "returns empty array" do
        subject

        expect(response).to have_http_status 200
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(data: [])
      end
    end

    context "when there are 6 books" do
      let!(:books) { create_list(:book, 6) }

      it "returns first 2 books" do
        subject

        expect(response).to have_http_status 200
        expect(JSON.parse(response.body, symbolize_names: true)).to eq(
          data: [
            {
              authors: [],
              id: books[0].id,
              title: books[0].title,
              series: nil,
              serno: nil
            },
            {
              authors: [],
              id: books[1].id,
              title: books[1].title,
              series: nil,
              serno: nil
            }
          ])
      end

      context "when requested page is 2" do
        subject(:call) { get :index, params: { page: 2 } }


        it "returns third and fourth books" do
          subject

          expect(response).to have_http_status 200
          expect(JSON.parse(response.body, symbolize_names: true)).to eq(
            data: [
              {
                authors: [],
                id: books[2].id,
                title: books[2].title,
                series: nil,
                serno: nil
              },
              {
                authors: [],
                id: books[3].id,
                title: books[3].title,
                series: nil,
                serno: nil
              }
            ])
        end
      end
    end
  end
end
