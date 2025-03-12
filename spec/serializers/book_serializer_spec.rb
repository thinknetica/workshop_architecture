RSpec.describe BookSerializer, type: :serializer do
  let(:book) { create(:book_with_authors) }

  describe 'serialization' do
    context 'when correct book is passed' do
      subject { described_class.new(book) }

      it "return correct json response" do
        serialized = JSON.parse(subject.to_json)

        expect(serialized.dig('books', 'id')).to eq(book.id)
        expect(serialized.dig('books', 'title')).to eq(book.title)
        expect(serialized.dig('books', 'insno')).to eq(book.insno)
        expect(serialized.dig('books', 'libid')).to eq(book.libid)
        expect(serialized.dig('books', 'authors').size).to eq(book.authors.size)
        expect(serialized.dig('books', 'language', 'id')).to eq(book.language.id)
        expect(serialized.dig('books', 'language', 'name')).to eq(book.language.name)
      end
    end
  end
end
